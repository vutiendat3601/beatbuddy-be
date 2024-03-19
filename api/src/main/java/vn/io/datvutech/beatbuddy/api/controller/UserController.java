package vn.io.datvutech.beatbuddy.api.controller;

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
import vn.io.datvutech.beatbuddy.api.dto.PlaylistDto;
import vn.io.datvutech.beatbuddy.api.model.request.PlaylistRequest;
import vn.io.datvutech.beatbuddy.api.model.response.Response;
import vn.io.datvutech.beatbuddy.api.service.PlaylistService;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "v1/users", produces = MediaType.APPLICATION_JSON_VALUE)
public class UserController {
    private final PlaylistService playlistService;

    @GetMapping(value = "{userId}/playlists/{playlistId}")
    public ResponseEntity<Response<PlaylistDto>> getUserPlaylist(
            @PathVariable UUID userId,
            @PathVariable UUID playlistId

    ) {
        PlaylistDto playlistDto = playlistService.getPlaylist(playlistId, userId);
        return ResponseEntity.ok(Response.success(playlistDto));
    }

    @PutMapping(value = "{userId}/playlists/{playlistId}/tracks", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<?>> addOrRemovePlaylistTracks(
            @PathVariable UUID playlistId,
            @RequestBody @Validated(PlaylistRequest.Update.class) PlaylistRequest playlistReq

    ) {
        playlistService.addOrRemovePlaylistTracks(playlistId, playlistReq);
        return ResponseEntity.ok(Response.success(null));
    }
}