package tech.datvu.beatbuddy.api.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.dto.PlaylistDto;
import tech.datvu.beatbuddy.api.dto.TrackSuggestionDto;
import tech.datvu.beatbuddy.api.model.request.PlaylistQueryRequest;
import tech.datvu.beatbuddy.api.model.request.TrackSuggestionQueryRequest;
import tech.datvu.beatbuddy.api.model.response.Response;
import tech.datvu.beatbuddy.api.service.PlaylistService;
import tech.datvu.beatbuddy.api.service.TrackSuggestionService;

@RequiredArgsConstructor
@RequestMapping(value = "v1/me", produces = MediaType.APPLICATION_JSON_VALUE)
@RestController
public class MeController {
    private final TrackSuggestionService trackSuggService;
    private final PlaylistService playlistService;

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
}
