package tech.datvu.beatbuddy.api.controller;

import java.util.List;

import org.hibernate.validator.constraints.Range;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.dto.ArtistDto;
import tech.datvu.beatbuddy.api.dto.TrackSuggestionDto;
import tech.datvu.beatbuddy.api.model.request.TrackSuggestionQueryRequest;
import tech.datvu.beatbuddy.api.model.response.Response;
import tech.datvu.beatbuddy.api.service.ArtistService;
import tech.datvu.beatbuddy.api.service.TrackSuggestionService;

@RequiredArgsConstructor
@RequestMapping(value = "v1/admin", produces = MediaType.APPLICATION_JSON_VALUE)
public class AdminController {
    private final TrackSuggestionService trackSuggService;
    private final ArtistService artistService;

    @GetMapping("track-suggestions")
    public ResponseEntity<Response<List<TrackSuggestionDto>>> getTrackSuggestions(
            @Valid TrackSuggestionQueryRequest trackSuggPageReq) {
        Page<TrackSuggestionDto> suggTrackDtoPage = trackSuggService.getTrackSuggestions(trackSuggPageReq);
        return ResponseEntity.ok(Response.successPage(suggTrackDtoPage));
    }

    @GetMapping("artists")
    public ResponseEntity<Response<List<ArtistDto>>> getArtists(
            @Range(min = 0, max = Integer.MAX_VALUE) @RequestParam int page,
            @Range(min = 1, max = 100) @RequestParam int size,
            @RequestParam(required = false, defaultValue = "") String q,
            @RequestParam(required = false) String sortBy) {
        Page<ArtistDto> artistDtoPage = artistService.getArtists(page, size, q, sortBy);
        return ResponseEntity.ok(Response.successPage(artistDtoPage));
    }
}
