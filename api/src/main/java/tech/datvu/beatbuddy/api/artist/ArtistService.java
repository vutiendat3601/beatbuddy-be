package tech.datvu.beatbuddy.api.artist;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;

import tech.datvu.beatbuddy.api.artist.models.ArtistDto;
import tech.datvu.beatbuddy.api.artist.models.ArtistRequest;

public interface ArtistService {
    UUID createArtist(ArtistRequest artistReq);

    Page<ArtistDto> getArtists(int page, int size, String sortBy);

    ArtistDto getArtist(UUID artistId);

    List<ArtistDto> getArtists(List<UUID> artistIds);
}
