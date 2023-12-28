package tech.datvu.beatbuddy.api.track;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.shared.models.Response;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestionDto;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestionQueryRequest;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestionRequest;

@RestController
@RequiredArgsConstructor
@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
public class TrackController {
    private final TrackService trackService;

    @PostMapping(value = "v1/tracks/suggestion", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Response<UUID>> suggestTrack(@Valid TrackSuggestionRequest suggTrackReq) {
        UUID suggTrackId = trackService.createTrackSuggestion(suggTrackReq);
        return ResponseEntity.ok(Response.success(suggTrackId));
    }

    @GetMapping(value = "v1/admin/tracks/suggestion")
    @PreAuthorize("hasAuthority('view_all_track_suggestion')")
    public ResponseEntity<Response<List<TrackSuggestionDto>>> getTrackSuggestions(
            @Valid TrackSuggestionQueryRequest trackSuggPageReq) {
        Page<TrackSuggestionDto> suggTrackDtoPage = trackService.getTrackSuggestions(trackSuggPageReq);
        return ResponseEntity.ok(Response.successPage(suggTrackDtoPage));
    }

    @GetMapping(value = "v1/me/tracks/suggestion")
    public ResponseEntity<Response<List<TrackSuggestionDto>>> getUserTrackSuggestions(
            @Valid TrackSuggestionQueryRequest trackSuggPageReq) {
        Page<TrackSuggestionDto> suggTrackDtoPage = trackService.getUserTrackSuggestions(trackSuggPageReq);
        return ResponseEntity.ok(Response.successPage(suggTrackDtoPage));
    }
}
