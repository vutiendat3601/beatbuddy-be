package vn.io.datvutech.beatbuddy.api.service.impl;

import static vn.io.datvutech.beatbuddy.api.entity.TrackSuggestion.TRACK_SUGGESTION_SORT_FIELDS;

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
import vn.io.datvutech.beatbuddy.api.dto.TrackSuggestionDto;
import vn.io.datvutech.beatbuddy.api.entity.Artist;
import vn.io.datvutech.beatbuddy.api.entity.TrackSuggestion;
import vn.io.datvutech.beatbuddy.api.entity.TrackSuggestionArtist;
import vn.io.datvutech.beatbuddy.api.exception.ArtistException;
import vn.io.datvutech.beatbuddy.api.exception.TrackException;
import vn.io.datvutech.beatbuddy.api.mapper.TrackSuggestionMapper;
import vn.io.datvutech.beatbuddy.api.model.request.TrackSuggestionQueryRequest;
import vn.io.datvutech.beatbuddy.api.model.request.TrackSuggestionRequest;
import vn.io.datvutech.beatbuddy.api.repository.ArtistRepository;
import vn.io.datvutech.beatbuddy.api.repository.TrackSuggestionArtistRepository;
import vn.io.datvutech.beatbuddy.api.repository.TrackSuggestionRepository;
import vn.io.datvutech.beatbuddy.api.service.FileService;
import vn.io.datvutech.beatbuddy.api.service.TrackSuggestionService;
import vn.io.datvutech.beatbuddy.api.util.PaginationUtil;
import vn.io.datvutech.beatbuddy.api.util.TextUtil;
import vn.io.datvutech.beatbuddy.api.util.TrackSuggestionUrlProcessor;
import vn.io.datvutech.beatbuddy.api.util.UserContext;
import vn.io.datvutech.beatbuddy.api.util.parser.SortParser;

@Service
@RequiredArgsConstructor
public class TrackSuggestionServiceImpl implements TrackSuggestionService {
    private final TrackSuggestionMapper trackSuggMapper;
    private final TrackSuggestionUrlProcessor trackSuggUrlProcessor;
    private final TrackSuggestionRepository trackSuggRepo;
    private final ArtistRepository artistRepo;
    private final TrackSuggestionArtistRepository trackSuggArtistRepo;
    private final FileService fileService;

    @Override
    public UUID createTrackSuggestion(TrackSuggestionRequest trackSuggReq) {
        // ## Process url, if there is any audio file available
        // String audioRefCode = processUrl(suggTrackReq.getUrl());
        TrackSuggestion trackSugg = trackSuggRepo.findFirstByUrlAndCreatedBy(trackSuggReq.getUrl(),
                UserContext.getUserId()).orElse(null);

        if (trackSugg == null) {
            // ## Validate artists UUIDs
            Set<UUID> artistIds = trackSuggReq.getArtists();
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
            String lyricsFile = fileService.saveLyricsFile(trackSuggReq.getLyrics(), true);
            String thumbFile = fileService.saveImageFile(trackSuggReq.getThumbnail(), false);
            trackSugg = trackSuggMapper.mapToTrackSuggestion(trackSuggReq);
            trackSugg.setLyrics(lyricsFile);
            trackSugg.setThumbnail(thumbFile);
            trackSugg.setTags(tags);
            trackSugg = trackSuggRepo.save(trackSugg);
            UUID trackSuggId = trackSugg.getId();

            // ## Save TrackSuggestion, Artist mapping
            trackSuggArtists.stream().forEach(trackSuggArtist -> trackSuggArtist.setTrackSuggestionId(trackSuggId));
            trackSuggArtistRepo.saveAll(trackSuggArtists);
            if (trackSugg.getUrl() != null) {
                trackSuggUrlProcessor.process(trackSuggId, trackSuggReq.getUrl());
            }
            return trackSuggId;
        }
        throw TrackException.TRACK_SUGGESTION_REQUESTED.instance();
    }

    @Override
    public Page<TrackSuggestionDto> getTrackSuggestions(TrackSuggestionQueryRequest pageReq) {
        // ## Check pagination params and parsing sortBy
        PaginationUtil.checkPagination(pageReq.getPage(), pageReq.getSize());
        Sort sort = SortParser.parseQueryParam(pageReq.getSortBy(), TRACK_SUGGESTION_SORT_FIELDS);
        Pageable pageable = PageRequest.of(pageReq.getPage(), pageReq.getSize(), sort);

        // ## Find all artists, matches the keyword
        String keyword = pageReq.getQ();
        keyword = keyword == null ? "" : TextUtil.removeAccents(keyword.trim());
        DateTimeFormatter isoDateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fromDate = LocalDate.parse(pageReq.getFromDate(), isoDateFormatter);
        LocalDate toDate = LocalDate.parse(pageReq.getToDate(), isoDateFormatter);
        Page<TrackSuggestion> trackSuggPage = trackSuggRepo.findAll(
                pageable,
                keyword,
                fromDate,
                toDate.plusDays(1));
        Page<TrackSuggestionDto> trackSuggDtoPage = trackSuggPage.map(trackSuggMapper::mapToTrackSuggestionDto);
        mapArtistDto(trackSuggDtoPage);
        return trackSuggDtoPage;
    }

    @Override
    public Page<TrackSuggestionDto> getUserTrackSuggestions(TrackSuggestionQueryRequest pageReq) {
        // ## Check pagination params and parsing sortBy
        PaginationUtil.checkPagination(pageReq.getPage(), pageReq.getSize());
        Sort sort = SortParser.parseQueryParam(pageReq.getSortBy(), TRACK_SUGGESTION_SORT_FIELDS);
        Pageable pageable = PageRequest.of(pageReq.getPage(), pageReq.getSize(), sort);

        // ## Find track suggestion, matches the keyword and
        String keyword = pageReq.getQ();
        keyword = keyword == null ? "" : TextUtil.removeAccents(keyword.trim());
        DateTimeFormatter isoDateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fromDate = LocalDate.parse(pageReq.getFromDate(), isoDateFormatter);
        LocalDate toDate = LocalDate.parse(pageReq.getToDate(), isoDateFormatter);
        Page<TrackSuggestion> trackSuggPage = trackSuggRepo
                .findByKeywordAndCreatedAtRangeAndCreatedBy(
                        pageable,
                        keyword,
                        fromDate,
                        toDate.plusDays(1),
                        UserContext.getUserId());

        // ## Find all TrackSuggestionArtist suggested by current user
        Page<TrackSuggestionDto> trackSuggDtoPage = trackSuggPage.map(trackSuggMapper::mapToTrackSuggestionDto);
        mapArtistDto(trackSuggDtoPage);
        return trackSuggDtoPage;
    }

    private void mapArtistDto(Page<TrackSuggestionDto> trackSuggDtoPage) {
        List<TrackSuggestionArtist> trackSuggestionArtists = trackSuggArtistRepo
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
}
