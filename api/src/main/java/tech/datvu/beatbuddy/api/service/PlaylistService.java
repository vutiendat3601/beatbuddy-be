package tech.datvu.beatbuddy.api.service;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;

import jakarta.validation.Valid;
import tech.datvu.beatbuddy.api.dto.PlaylistDto;
import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.model.request.PlaylistQueryRequest;
import tech.datvu.beatbuddy.api.model.request.PlaylistRequest;

public interface PlaylistService {
    UUID createPlaylist(PlaylistRequest playlistReq);

    PlaylistDto getPublicPlaylist(UUID playlistId);

    PlaylistDto getPlaylist(UUID playlistId, String username);

    void addOrRemovePlaylistTracks(UUID playlistId, PlaylistRequest playlistReq);

    Page<PlaylistDto> getUserPlaylits(@Valid PlaylistQueryRequest playlistQueryReq);

    List<TrackDto> getPlaylistTracks(UUID playlistId);
}
