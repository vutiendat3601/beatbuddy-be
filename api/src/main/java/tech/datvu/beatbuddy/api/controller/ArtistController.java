package tech.datvu.beatbuddy.api.controller;

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
import tech.datvu.beatbuddy.api.dto.ArtistDto;
import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.model.request.ArtistRequest;
import tech.datvu.beatbuddy.api.model.response.Response;
import tech.datvu.beatbuddy.api.service.ArtistService;

@RestController
@RequiredArgsConstructor
@RequestMapping(value = "v1/artists", produces = MediaType.APPLICATION_JSON_VALUE)
public class ArtistController {
    private final ArtistService artistService;

    /* #: Public */
    @GetMapping("{id}")
    public ResponseEntity<Response<ArtistDto>> getArtist(@PathVariable UUID id) {
        ArtistDto artistDto = artistService.getArtist(id);
        return ResponseEntity.ok(Response.success(artistDto));
    }

    @GetMapping
    public ResponseEntity<Response<List<ArtistDto>>> getSeveralArtists(
            @Valid @Size(min = 1, max = 100) @RequestParam List<UUID> ids

    ) {
        List<ArtistDto> artistDtos = artistService.getArtists(ids);
        return ResponseEntity.ok(Response.success(artistDtos));
    }
    /* # Public */

    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Response<UUID>> createArtist(@Valid ArtistRequest artistReq) {
        UUID artistId = artistService.createArtist(artistReq);
        return ResponseEntity.ok(Response.success(artistId));
    }

    @GetMapping("{id}/tracks")
    public ResponseEntity<Response<List<TrackDto>>> getArtistTracks(
            @PathVariable("id") UUID artistId,
            @Range(min = 0, max = Integer.MAX_VALUE) @RequestParam int page,
            @Range(min = 1, max = 100) @RequestParam int size) {
        Page<TrackDto> artistTrackDtos = artistService.getArtistTracks(artistId, page, size);
        return ResponseEntity.ok(Response.successPage(artistTrackDtos));
    }
}
