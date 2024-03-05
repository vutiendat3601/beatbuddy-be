package tech.datvu.beatbuddy.api.controller;

import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.dto.PlaylistDto;
import tech.datvu.beatbuddy.api.model.request.PlaylistRequest;
import tech.datvu.beatbuddy.api.model.response.Response;
import tech.datvu.beatbuddy.api.service.PlaylistService;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "v1/users", produces = MediaType.APPLICATION_JSON_VALUE)
public class UserController {
    private final PlaylistService playlistService;

    @GetMapping(value = "{username}/playlists/{playlistId}")
    public ResponseEntity<Response<PlaylistDto>> getUserPlaylist(
            @PathVariable String username,
            @PathVariable UUID playlistId

    ) {
        PlaylistDto playlistDto = playlistService.getPlaylist(playlistId, username);
        return ResponseEntity.ok(Response.success(playlistDto));
    }

    @PutMapping(value = "{username}/playlists/{playlistId}/tracks", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<?>> addOrRemovePlaylistTracks(
            @PathVariable UUID playlistId,
            @RequestBody @Validated(PlaylistRequest.Update.class) PlaylistRequest playlistReq

    ) {
        playlistService.addOrRemovePlaylistTracks(playlistId, playlistReq);
        return ResponseEntity.ok(Response.success(null));
    }
}
