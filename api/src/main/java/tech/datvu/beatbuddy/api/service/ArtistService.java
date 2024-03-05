package tech.datvu.beatbuddy.api.service;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;

import tech.datvu.beatbuddy.api.dto.ArtistDto;
import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.model.request.ArtistRequest;
import tech.datvu.beatbuddy.api.model.request.PaginationRequest;
import tech.datvu.beatbuddy.api.model.request.PageSortRequest;

public interface ArtistService {
    UUID createArtist(ArtistRequest artistReq);

    Page<ArtistDto> getArtists(int page, int size, String q, String sortBy);

    ArtistDto getArtist(UUID artistId);

    List<ArtistDto> getArtists(Iterable<UUID> artistIds);

    Page<TrackDto> getArtistTracks(UUID id, PageSortRequest pageReq);

    List<TrackDto> getArtistTopTracks(UUID artistId, Integer top);

    Page<ArtistDto> getPopularArtists(PaginationRequest pageReq);

    void increaseSearchPriority(UUID artistId);
}
