package tech.datvu.beatbuddy.api.artist;

import java.util.List;
import java.util.UUID;

import org.hibernate.validator.constraints.Range;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Size;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.artist.models.ArtistDto;
import tech.datvu.beatbuddy.api.artist.models.ArtistRequest;
import tech.datvu.beatbuddy.api.shared.models.Response;

@RestController
@RequiredArgsConstructor
@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
public class ArtistController {
    private final ArtistService artistService;

    @PostMapping(value = "v1/admin/artists", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    @PreAuthorize("hasAuthority('create_artist')")
    public ResponseEntity<Response<UUID>> createArtist(@Valid ArtistRequest artistReq) {
        UUID artistId = artistService.createArtist(artistReq);
        return ResponseEntity.ok(Response.success(artistId));
    }

    @GetMapping(value = "v1/admin/artists")
    @PreAuthorize("hasAuthority('view_all_artist')")
    public ResponseEntity<Response<List<ArtistDto>>> getArtists(
            @Range(min = 0, max = Integer.MAX_VALUE) @RequestParam int page,
            @Range(min = 1, max = 100) @RequestParam int size,
            @RequestParam(required = false) String sortBy) {
        Page<ArtistDto> artistDtoPage = artistService.getArtists(page, size, sortBy);
        return ResponseEntity.ok(Response.successPage(artistDtoPage));
    }

    @GetMapping(value = "v1/artists/{id}")
    public ResponseEntity<Response<ArtistDto>> getArtist(@PathVariable UUID id) {
        ArtistDto artistDto = artistService.getArtist(id);
        return ResponseEntity.ok(Response.success(artistDto));
    }

    @GetMapping(value = "v1/artists")
    public ResponseEntity<Response<List<ArtistDto>>> getSeveralArtists(
            @Valid @Size(min = 1, max = 100) @RequestParam List<UUID> ids) {
        List<ArtistDto> artistDtos = artistService.getArtists(ids);
        return ResponseEntity.ok(Response.success(artistDtos));
    }
}
