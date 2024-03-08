package vn.io.datvutech.beatbuddy.api.service;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;

import vn.io.datvutech.beatbuddy.api.dto.ArtistDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackDto;
import vn.io.datvutech.beatbuddy.api.model.request.ArtistRequest;
import vn.io.datvutech.beatbuddy.api.model.request.PageSortRequest;
import vn.io.datvutech.beatbuddy.api.model.request.PaginationRequest;

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
