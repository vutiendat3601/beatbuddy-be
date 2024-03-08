package vn.io.datvutech.beatbuddy.api.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.dto.PlaybackDto;
import vn.io.datvutech.beatbuddy.api.dto.PlaylistDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackSuggestionDto;
import vn.io.datvutech.beatbuddy.api.model.request.PlaybackRequest;
import vn.io.datvutech.beatbuddy.api.model.request.PlaylistQueryRequest;
import vn.io.datvutech.beatbuddy.api.model.request.TrackSuggestionQueryRequest;
import vn.io.datvutech.beatbuddy.api.model.response.Response;
import vn.io.datvutech.beatbuddy.api.service.PlaybackService;
import vn.io.datvutech.beatbuddy.api.service.PlaylistService;
import vn.io.datvutech.beatbuddy.api.service.TrackSuggestionService;

@RequiredArgsConstructor
@RequestMapping(value = "v1/me", produces = MediaType.APPLICATION_JSON_VALUE)
@RestController
public class MeController {
    private final TrackSuggestionService trackSuggService;
    private final PlaylistService playlistService;
    private final PlaybackService playbackService;

    @GetMapping("track-suggestions")
    public ResponseEntity<Response<List<TrackSuggestionDto>>> getUserTrackSuggestions(
            @Valid TrackSuggestionQueryRequest trackSuggPageReq

    ) {
        Page<TrackSuggestionDto> suggTrackDtoPage = trackSuggService.getUserTrackSuggestions(trackSuggPageReq);
        return ResponseEntity.ok(Response.successPage(suggTrackDtoPage));
    }

    @GetMapping("playlists")
    public ResponseEntity<Response<List<PlaylistDto>>> getUserPlaylists(
            @Valid PlaylistQueryRequest playlistQueryReq

    ) {
        Page<PlaylistDto> playlistDtos = playlistService.getUserPlaylits(playlistQueryReq);
        return ResponseEntity.ok(Response.successPage(playlistDtos));
    }

    @GetMapping("playback")
    public ResponseEntity<Response<PlaybackDto>> getUserPlayback() {
        PlaybackDto playbackDto = playbackService.getUserPlayback();
        return ResponseEntity.ok(Response.success(playbackDto));
    }

    @PutMapping(value = "playback", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Response<Boolean>> updateUserPlayback(
            @Validated(PlaybackRequest.Update.class) @RequestBody PlaybackRequest playbackReq) {
        playbackService.updateUserPlayback(playbackReq);
        return ResponseEntity.ok(Response.success(true));
    }
}
