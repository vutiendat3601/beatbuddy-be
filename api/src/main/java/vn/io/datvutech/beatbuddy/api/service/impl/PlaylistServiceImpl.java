package vn.io.datvutech.beatbuddy.api.service.impl;

import static vn.io.datvutech.beatbuddy.api.entity.Playlist.PLAYLIST_SORT_FIELDS;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.dto.PlaylistDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackDto;
import vn.io.datvutech.beatbuddy.api.entity.Playlist;
import vn.io.datvutech.beatbuddy.api.entity.PlaylistTrack;
import vn.io.datvutech.beatbuddy.api.entity.Track;
import vn.io.datvutech.beatbuddy.api.exception.PlaylistException;
import vn.io.datvutech.beatbuddy.api.mapper.PlaylistMapper;
import vn.io.datvutech.beatbuddy.api.model.request.PlaylistQueryRequest;
import vn.io.datvutech.beatbuddy.api.model.request.PlaylistRequest;
import vn.io.datvutech.beatbuddy.api.repository.PlaylistRepository;
import vn.io.datvutech.beatbuddy.api.repository.PlaylistTrackRepository;
import vn.io.datvutech.beatbuddy.api.repository.TrackRepository;
import vn.io.datvutech.beatbuddy.api.service.PlaylistService;
import vn.io.datvutech.beatbuddy.api.service.PlaylistServiceAsync;
import vn.io.datvutech.beatbuddy.api.service.TrackService;
import vn.io.datvutech.beatbuddy.api.util.PaginationUtil;
import vn.io.datvutech.beatbuddy.api.util.TextUtil;
import vn.io.datvutech.beatbuddy.api.util.UserContext;
import vn.io.datvutech.beatbuddy.api.util.parser.SortParser;

@RequiredArgsConstructor
@Service
public class PlaylistServiceImpl implements PlaylistService {

    private final TrackService trackService;

    private final PlaylistRepository playlistRepo;
    private final PlaylistTrackRepository playlistTrackRepo;
    private final TrackRepository trackRepo;
    private final PlaylistMapper playlistMapper;

    private final PlaylistServiceAsync playlistServiceAsync;

    @Override
    public UUID createPlaylist(PlaylistRequest playlistReq) {
        Playlist playlist = playlistMapper.mapToPlaylist(playlistReq);
        playlist = playlistRepo.save(playlist);
        addOrRemovePlaylistTracks(playlist.getId(), playlistReq);
        playlistServiceAsync.createPlaylist(playlist);
        return playlist.getId();
    }

    @Override
    public PlaylistDto getPublicPlaylist(UUID playlistId) {
        Playlist playlist = playlistRepo.findByIdAndIsPublicTrue(playlistId)
                .orElseThrow(() -> PlaylistException.PLAYLIST_NOT_FOUND.instance());
        PlaylistDto playlistDto = playlistMapper.mapToPlaylistDto(playlist);
        playlistDto.setTracks(getPlaylistTracks(playlistId));
        return playlistDto;
    }

    @Override
    public void addOrRemovePlaylistTracks(UUID playlistId, PlaylistRequest playlistReq) {
        final Playlist playlist = playlistRepo.findById(playlistId)
                .orElseThrow(() -> PlaylistException.PLAYLIST_NOT_FOUND.instance());
        long durationSec = 0;
        final List<PlaylistTrack> playlistTracks = new LinkedList<>();
        if (playlistReq.getIsTrackRemove()) {
            for (UUID trackId : playlistReq.getTrackIds()) {
                Track track = trackRepo.findById(playlistId).orElse(null);
                if (track != null) {
                    PlaylistTrack playlistTrack = playlistTrackRepo.findByPlaylistIdAndTrackId(playlistId, trackId)
                            .orElse(null);
                    if (playlistTrack != null) {
                        durationSec -= track.getDurationSec();
                        playlistTrack.setActive(false);
                        playlistTracks.add(playlistTrack);
                    }
                }
            }
        } else {
            for (UUID trackId : playlistReq.getTrackIds()) {
                Track track = trackRepo.findById(playlistId).orElse(null);

                if (track != null) {
                    PlaylistTrack playlistTrack = playlistTrackRepo.findByPlaylistIdAndTrackId(playlistId, trackId)
                            .orElse(new PlaylistTrack(playlistId, trackId));
                    playlistTrack.setActive(true);
                    durationSec += track.getDurationSec();
                    playlistTracks.add(playlistTrack);
                }
            }
        }

        playlist.setDurationSec(playlist.getDurationSec() + durationSec);
        playlistRepo.save(playlist);
        playlistTrackRepo.saveAll(playlistTracks);
    }

    @Override
    public PlaylistDto getPlaylist(UUID playlistId, UUID userId) {
        Playlist playlist = playlistRepo.findByIdAndCreatedBy(playlistId, userId + "")
                .orElseThrow(() -> PlaylistException.PLAYLIST_NOT_FOUND.instance());
        PlaylistDto playlistDto = playlistMapper.mapToPlaylistDto(playlist);
        playlistDto.setTracks(getPlaylistTracks(playlistId));
        return playlistDto;
    }

    @Override
    public List<TrackDto> getPlaylistTracks(UUID playlistId) {
        List<PlaylistTrack> playlistTracks = playlistTrackRepo.findAllByPlaylistId(playlistId);
        List<UUID> trackIds = playlistTracks.stream().map(t -> t.getTrackId()).toList();
        List<TrackDto> trackDtos = trackService.getTracks(trackIds);
        return trackDtos;
    }

    @Override
    public Page<PlaylistDto> getUserPlaylits(@Valid PlaylistQueryRequest pageReq) {
        // ## Check pagination params and parsing sortBy
        PaginationUtil.checkPagination(pageReq.getPage(), pageReq.getSize());
        Sort sort = SortParser.parseQueryParam(pageReq.getSortBy(), PLAYLIST_SORT_FIELDS);
        Pageable pageable = PageRequest.of(pageReq.getPage(), pageReq.getSize(), sort);

        // ## Find track suggestion, matches the keyword and
        String keyword = pageReq.getQ();
        keyword = keyword == null ? "" : TextUtil.removeAccents(keyword.trim());
        DateTimeFormatter isoDateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate fromDate = LocalDate.parse(pageReq.getFromDate(), isoDateFormatter);
        LocalDate toDate = LocalDate.parse(pageReq.getToDate(), isoDateFormatter);
        Page<Playlist> playlistPage = playlistRepo.findByKeywordAndCreatedAtRangeAndCreatedBy(
                pageable,
                keyword,
                fromDate,
                toDate,
                UserContext.getUserId()

        );

        // ## Find all TrackSuggestionArtist suggested by current user
        Page<PlaylistDto> playlistDtoPage = playlistPage.map(playlistMapper::mapToPlaylistDto);
        playlistDtoPage.forEach(p -> p.setTracks(getPlaylistTracks(p.getId())));
        return playlistDtoPage;
    }
}
