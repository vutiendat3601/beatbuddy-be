package vn.io.datvutech.beatbuddy.api.service;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;

import jakarta.validation.Valid;
import vn.io.datvutech.beatbuddy.api.dto.PlaylistDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackDto;
import vn.io.datvutech.beatbuddy.api.model.request.PlaylistQueryRequest;
import vn.io.datvutech.beatbuddy.api.model.request.PlaylistRequest;

public interface PlaylistService {
    UUID createPlaylist(PlaylistRequest playlistReq);

    PlaylistDto getPublicPlaylist(UUID playlistId);

    PlaylistDto getPlaylist(UUID playlistId, UUID userId);

    void addOrRemovePlaylistTracks(UUID playlistId, PlaylistRequest playlistReq);

    Page<PlaylistDto> getUserPlaylits(@Valid PlaylistQueryRequest playlistQueryReq);

    List<TrackDto> getPlaylistTracks(UUID playlistId);
}
