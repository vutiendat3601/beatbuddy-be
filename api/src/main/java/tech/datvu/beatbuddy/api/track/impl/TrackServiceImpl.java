package tech.datvu.beatbuddy.api.track.impl;

import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.YOUTUBE_REF_CODE_PREFIX;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.artist.ArtistException;
import tech.datvu.beatbuddy.api.artist.ArtistRepo;
import tech.datvu.beatbuddy.api.artist.models.Artist;
import tech.datvu.beatbuddy.api.audio.AudioServiceAsync;
import tech.datvu.beatbuddy.api.audio.YouTubeService;
import tech.datvu.beatbuddy.api.file.FileService;
import tech.datvu.beatbuddy.api.shared.utils.PaginationUltil;
import tech.datvu.beatbuddy.api.shared.utils.TextUtil;
import tech.datvu.beatbuddy.api.shared.utils.UserContext;
import tech.datvu.beatbuddy.api.shared.utils.parser.SortParser;
import tech.datvu.beatbuddy.api.track.TrackException;
import tech.datvu.beatbuddy.api.track.TrackService;
import tech.datvu.beatbuddy.api.track.TrackSuggestionArtistRepo;
import tech.datvu.beatbuddy.api.track.TrackSuggestionRepo;
import tech.datvu.beatbuddy.api.track.models.TrackMapper;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestion;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestionArtist;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestionDto;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestionQueryRequest;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestionRequest;

@Service
@RequiredArgsConstructor
public class TrackServiceImpl implements TrackService {
    private static final String[] SUGGEST_TRACK_SORT_FIELDS = {
            "id", "title", "url", "releasedDate", "description", "createdAt"
    };

    // ## Mappers
    private final TrackMapper trackMapper;

    // ## Services
    private final AudioServiceAsync audioServiceAsync;
    private final FileService fileService;

    // ## Repos
    private final TrackSuggestionRepo suggTrackRepo;
    private final ArtistRepo artistRepo;
    private final TrackSuggestionArtistRepo trackSuggestionArtistRepo;

    @Override
    public UUID createTrackSuggestion(TrackSuggestionRequest suggTrackReq) {
        // ## Process url, if there is any audio file available
        String audioRefCode = processUrl(suggTrackReq.getUrl());
        boolean isRequested = audioRefCode == null
                ? suggTrackRepo
                        .findFirstByUrlAndCreatedBy(suggTrackReq.getUrl(), UserContext.getUsername())
                        .isPresent()
                : suggTrackRepo
                        .findFirstByAudioRefCodeAndCreatedBy(audioRefCode, UserContext.getUsername())
                        .isPresent();

        // ## Check if the user have requested this url before
        if (isRequested) {
            throw TrackException.TRACK_SUGGESTION_REQUESTED.instance();
        }

        // ## Validate artists UUIDs
        Set<UUID> artistIds = suggTrackReq.getArtists();
        final List<TrackSuggestionArtist> trackSuggArtists = new ArrayList<>();
        final StringBuilder tagsBuilder = new StringBuilder();
        artistIds.forEach(artistId -> {
            Artist artist = artistRepo.findPublicById(artistId)
                    .orElseThrow(() -> ArtistException.ARTIST_NOT_FOUND.instance());
            tagsBuilder.append(", " + artist.getName());
            trackSuggArtists.add(
                    TrackSuggestionArtist.builder()
                            .artistId(artistId)
                            .isActive(true)
                            .build());
        });
        String tags = tagsBuilder.length() > 2 ? tagsBuilder.substring(2) : null;
        
        // ## Save lyrics, thumbnail, and save track TrackSuggestion to database
        String lyricsFile = fileService.saveLyricsFile(suggTrackReq.getLyrics(), true);
        String thumbFile = fileService.saveImageFile(suggTrackReq.getThumbnail(), false);
        TrackSuggestion trackSugg = trackMapper.mapToTrackSuggestion(suggTrackReq);
        trackSugg.setLyrics(lyricsFile);
        trackSugg.setThumbnail(thumbFile);
        trackSugg.setAudioRefCode(audioRefCode);
        trackSugg.setTags(tags);
        trackSugg = suggTrackRepo.save(trackSugg);
        UUID trackSuggId = trackSugg.getId();

        // ## Save TrackSuggestion, Artist mapping
        trackSuggArtists.stream().forEach(trackSuggArtist -> trackSuggArtist.setTrackSuggestionId(trackSuggId));
        trackSuggestionArtistRepo.saveAll(trackSuggArtists);
        return trackSugg.getId();
    }

    @Override
    public Page<TrackSuggestionDto> getTrackSuggestions(TrackSuggestionQueryRequest pageReq) {
        // ## Check pagination params and parsing sortBy
        PaginationUltil.checkPageOffset(pageReq.getPage(), pageReq.getSize());
        Sort sort = SortParser.parseQueryParam(pageReq.getSortBy(), SUGGEST_TRACK_SORT_FIELDS);
        Pageable pageable = PageRequest.of(pageReq.getPage(), pageReq.getSize(), sort);

        // ## Find all artists, matches the keyword
        String keyword = pageReq.getQ();
        keyword = keyword == null ? "" : TextUtil.removeAccents(keyword.trim());
        DateTimeFormatter isoDateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fromDate = LocalDate.parse(pageReq.getFromDate(), isoDateFormatter);
        LocalDate toDate = LocalDate.parse(pageReq.getToDate(), isoDateFormatter);
        Page<TrackSuggestion> trackSuggPage = suggTrackRepo.findAll(
                pageable,
                keyword,
                fromDate,
                toDate.plusDays(1));
        Page<TrackSuggestionDto> trackSuggDtoPage = trackSuggPage.map(trackMapper::mapToTrackSuggestionDto);
        mapArtistDto(trackSuggDtoPage);
        return trackSuggDtoPage;
    }

    @Override
    public Page<TrackSuggestionDto> getUserTrackSuggestions(TrackSuggestionQueryRequest pageReq) {
        // ## Check pagination params and parsing sortBy
        PaginationUltil.checkPageOffset(pageReq.getPage(), pageReq.getSize());
        Sort sort = SortParser.parseQueryParam(pageReq.getSortBy(), SUGGEST_TRACK_SORT_FIELDS);
        Pageable pageable = PageRequest.of(pageReq.getPage(), pageReq.getSize(), sort);

        // ## Find track suggestion, matches the keyword and
        String keyword = pageReq.getQ();
        keyword = keyword == null ? "" : TextUtil.removeAccents(keyword.trim());
        DateTimeFormatter isoDateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fromDate = LocalDate.parse(pageReq.getFromDate(), isoDateFormatter);
        LocalDate toDate = LocalDate.parse(pageReq.getToDate(), isoDateFormatter);
        Page<TrackSuggestion> trackSuggPage = suggTrackRepo
                .findByKeywordAndArtistIdAndCreatedAtAndCreatedBy(
                        pageable,
                        keyword,
                        fromDate,
                        toDate.plusDays(1),
                        UserContext.getUsername());

        // ## Find all TrackSuggestionArtist suggested by current user
        Page<TrackSuggestionDto> trackSuggDtoPage = trackSuggPage.map(trackMapper::mapToTrackSuggestionDto);
        mapArtistDto(trackSuggDtoPage);
        return trackSuggDtoPage;
    }

    private void mapArtistDto(Page<TrackSuggestionDto> trackSuggDtoPage) {
        List<TrackSuggestionArtist> trackSuggestionArtists = trackSuggestionArtistRepo
                .findAllByTrackSuggestionIdIn(trackSuggDtoPage.map(ts -> ts.getId()).toList());
        final Map<UUID, TrackSuggestionDto.ArtistDto> artistDtosMap = new HashMap<>();
        trackSuggDtoPage.stream().forEach(tsDto -> {
            List<TrackSuggestionDto.ArtistDto> artistDtos = trackSuggestionArtists.stream()
                    .filter(tsa -> tsa.getTrackSuggestionId().equals(tsDto.getId()))
                    .map(tsa -> {
                        final UUID artistId = tsa.getArtistId();
                        if (!artistDtosMap.containsKey(artistId)) {
                            Artist artist = artistRepo.findById(artistId).orElse(null);
                            TrackSuggestionDto.ArtistDto artistDto = artist == null
                                    ? null
                                    : TrackSuggestionDto.ArtistDto.builder()
                                            .id(artistId)
                                            .nickName(artist.getName())
                                            .avatar(artist.getThumbnail())
                                            .isPublic(artist.isPublic())
                                            .build();
                            artistDtosMap.put(artistId, artistDto);
                        }
                        return artistDtosMap.get(artistId);
                    })
                    .toList();
            tsDto.setArtists(artistDtos);
        });
    }

    private String processUrl(String url) {
        if (url != null) {
            // ## Case YouTube url
            YouTubeService.YouTubeUrl ytUrl = YouTubeService.parseYouTubeLink(url);
            if (ytUrl != null && ytUrl.getVideoId() != null) {
                String audioRefCode = YOUTUBE_REF_CODE_PREFIX + ytUrl.getVideoId();
                audioServiceAsync.saveYouTubeAudio(url, audioRefCode);
                return audioRefCode;
            }
        }
        return null;
    }
}
