package tech.datvu.beatbuddy.api.service.impl;

import static tech.datvu.beatbuddy.api.entity.Playlist.PLAYLIST_SORT_FIELDS;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.dto.PlaylistDto;
import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.entity.Playlist;
import tech.datvu.beatbuddy.api.entity.PlaylistTrack;
import tech.datvu.beatbuddy.api.entity.Track;
import tech.datvu.beatbuddy.api.exception.PlaylistException;
import tech.datvu.beatbuddy.api.mapper.PlaylistMapper;
import tech.datvu.beatbuddy.api.model.request.PlaylistQueryRequest;
import tech.datvu.beatbuddy.api.model.request.PlaylistRequest;
import tech.datvu.beatbuddy.api.repository.PlaylistRepository;
import tech.datvu.beatbuddy.api.repository.PlaylistTrackRepository;
import tech.datvu.beatbuddy.api.repository.TrackRepository;
import tech.datvu.beatbuddy.api.service.PlaylistService;
import tech.datvu.beatbuddy.api.service.PlaylistServiceAsync;
import tech.datvu.beatbuddy.api.service.TrackService;
import tech.datvu.beatbuddy.api.util.PaginationUltil;
import tech.datvu.beatbuddy.api.util.TextUtil;
import tech.datvu.beatbuddy.api.util.UserContext;
import tech.datvu.beatbuddy.api.util.parser.SortParser;

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
    public long addOrRemovePlaylistTracks(UUID playlistId, PlaylistRequest playlistReq) {
        final Playlist playlist = playlistRepo.findById(playlistId)
                .orElseThrow(() -> PlaylistException.PLAYLIST_NOT_FOUND.instance());
        int cntSuccess = 0;
        for (UUID trackId : playlistReq.getTrackIds()) {
            PlaylistTrack playlistTrack = playlistTrackRepo.findByPlaylistIdAndTrackId(playlistId, trackId)
                    .orElseGet(() -> {
                        Track track = trackRepo.findById(trackId).orElse(null);
                        if (track != null) {
                            PlaylistTrack newPlaylistTrack = new PlaylistTrack();
                            newPlaylistTrack.setPlaylistId(playlistId);
                            newPlaylistTrack.setTrackId(trackId);
                            long durationSec = playlistReq.getIsTrackRemove() ? -track.getDurationSec()
                                    : track.getDurationSec();
                            long playlistDurationSec = playlist.getDurationSec() + durationSec;

                            playlist.setDurationSec(playlistDurationSec);
                            return newPlaylistTrack;
                        }
                        return null;
                    });
            if (playlistTrack != null) {
                playlistTrack.setActive(!playlistReq.getIsTrackRemove());
                playlistTrackRepo.save(playlistTrack);
                cntSuccess++;
            }
        }
        playlistRepo.save(playlist);
        return cntSuccess;
    }

    @Override
    public PlaylistDto getPlaylist(UUID playlistId, String username) {
        Playlist playlist = playlistRepo.findByIdAndCreatedBy(playlistId, username)
                .orElseThrow(() -> PlaylistException.PLAYLIST_NOT_FOUND.instance());
        PlaylistDto playlistDto = playlistMapper.mapToPlaylistDto(playlist);
        playlistDto.setTracks(getPlaylistTracks(playlistId));
        return playlistDto;
    }

    @Override
    public Page<PlaylistDto> getUserPlaylits(@Valid PlaylistQueryRequest pageReq) {
        // ## Check pagination params and parsing sortBy
        PaginationUltil.checkPageOffset(pageReq.getPage(), pageReq.getSize());
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
                UserContext.getUsername()

        );

        // ## Find all TrackSuggestionArtist suggested by current user
        Page<PlaylistDto> playlistDtoPage = playlistPage.map(playlistMapper::mapToPlaylistDto);
        playlistDtoPage.forEach(p -> p.setTracks(getPlaylistTracks(p.getId())));
        return playlistDtoPage;
    }

    @Override
    public List<TrackDto> getPlaylistTracks(UUID playlistId) {
        List<PlaylistTrack> playlistTracks = playlistTrackRepo.findAllByPlaylistId(playlistId);
        List<UUID> trackIds = playlistTracks.stream().map(t -> t.getTrackId()).toList();
        List<TrackDto> trackDtos = trackService.getTracks(trackIds);
        return trackDtos;
    }
}
