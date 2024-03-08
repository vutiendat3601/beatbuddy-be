package vn.io.datvutech.beatbuddy.api.controller;

import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.model.request.TrackSuggestionRequest;
import vn.io.datvutech.beatbuddy.api.model.response.Response;
import vn.io.datvutech.beatbuddy.api.service.TrackSuggestionService;

@RequiredArgsConstructor
@RequestMapping(value = "v1/track-suggestions", produces = MediaType.APPLICATION_JSON_VALUE)
@RestController
public class TrackSuggestionController {
    private final TrackSuggestionService trackSuggService;

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Response<UUID>> suggestTrack(@Valid TrackSuggestionRequest suggTrackReq) {
        UUID suggTrackId = trackSuggService.createTrackSuggestion(suggTrackReq);
        return ResponseEntity.ok(Response.success(suggTrackId));
    }
}
