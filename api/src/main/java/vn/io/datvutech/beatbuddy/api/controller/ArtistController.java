package vn.io.datvutech.beatbuddy.api.controller;

import java.util.List;
import java.util.UUID;

import org.hibernate.validator.constraints.Range;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Size;
import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.dto.ArtistDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackDto;
import vn.io.datvutech.beatbuddy.api.model.request.ArtistRequest;
import vn.io.datvutech.beatbuddy.api.model.request.PageSortRequest;
import vn.io.datvutech.beatbuddy.api.model.request.PaginationRequest;
import vn.io.datvutech.beatbuddy.api.model.response.Response;
import vn.io.datvutech.beatbuddy.api.service.ArtistService;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "v1/artists", produces = MediaType.APPLICATION_JSON_VALUE)
public class ArtistController {
    private final ArtistService artistService;

    /* #: Public */
    @GetMapping("{artistId}")
    public ResponseEntity<Response<ArtistDto>> getArtist(@PathVariable UUID artistId) {
        ArtistDto artistDto = artistService.getArtist(artistId);
        artistService.increaseSearchPriority(artistId);
        return ResponseEntity.ok(Response.success(artistDto));
    }

    @GetMapping
    public ResponseEntity<Response<List<ArtistDto>>> getSeveralArtists(
            @Valid @Size(min = 1, max = 100) @RequestParam(name = "artistIds") List<UUID> artistIds

    ) {
        List<ArtistDto> artistDtos = artistService.getArtists(artistIds);
        return ResponseEntity.ok(Response.success(artistDtos));
    }

    @GetMapping("{artistId}/tracks")
    public ResponseEntity<Response<List<TrackDto>>> getArtistTracks(
            @PathVariable UUID artistId,
            @Valid PageSortRequest pageReq

    ) {
        Page<TrackDto> artistTrackDtos = artistService.getArtistTracks(artistId, pageReq);
        return ResponseEntity.ok(Response.successPage(artistTrackDtos));
    }

    @GetMapping("feed/popularity")
    public ResponseEntity<Response<List<ArtistDto>>> getPopularArtists(PaginationRequest pageReq) {
        Page<ArtistDto> artistDtos = artistService.getPopularArtists(pageReq);
        return ResponseEntity.ok(Response.successPage(artistDtos));
    }

    @GetMapping("{artistId}/top-tracks")
    public ResponseEntity<Response<List<TrackDto>>> getArtistTopTracks(
            @PathVariable UUID artistId,
            @Range(min = 10, max = 100) @RequestParam(required = false, defaultValue = "10") Integer top

    ) {
        List<TrackDto> artistTrackDtos = artistService.getArtistTopTracks(artistId, top);
        return ResponseEntity.ok(Response.success(artistTrackDtos));
    }
    /* # Public */

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Response<UUID>> createArtist(@Valid ArtistRequest artistReq) {
        UUID artistId = artistService.createArtist(artistReq);
        return ResponseEntity.ok(Response.success(artistId));
    }

}
