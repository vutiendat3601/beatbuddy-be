package vn.io.datvutech.beatbuddy.api.controller;

import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.dto.PlaylistDto;
import vn.io.datvutech.beatbuddy.api.model.request.PlaylistRequest;
import vn.io.datvutech.beatbuddy.api.model.response.Response;
import vn.io.datvutech.beatbuddy.api.service.PlaylistService;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "v1/playlists", produces = MediaType.APPLICATION_JSON_VALUE)
public class PlaylistController {
    private final PlaylistService playlistService;

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Response<UUID>> createPlaylist(@Valid PlaylistRequest playlistReq) {
        UUID playlistId = playlistService.createPlaylist(playlistReq);
        return ResponseEntity.ok(Response.success(playlistId));
    }

    @GetMapping("{playlistId}")
    public ResponseEntity<Response<PlaylistDto>> getPlaylist(
            @PathVariable UUID playlistId

    ) {
        PlaylistDto playlistDto = playlistService.getPublicPlaylist(playlistId);
        return ResponseEntity.ok(Response.success(playlistDto));
    }

}
