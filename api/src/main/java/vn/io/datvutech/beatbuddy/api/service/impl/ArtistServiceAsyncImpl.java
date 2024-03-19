package vn.io.datvutech.beatbuddy.api.service.impl;

import static vn.io.datvutech.beatbuddy.api.model.ResourceType.ARTIST;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.model.ResourceType;
import vn.io.datvutech.beatbuddy.api.model.request.SearchRequest;
import vn.io.datvutech.beatbuddy.api.repository.ArtistRepository;
import vn.io.datvutech.beatbuddy.api.service.ArtistServiceAsync;
import vn.io.datvutech.beatbuddy.api.service.SearchServiceAsync;

@RequiredArgsConstructor
@Service
public class ArtistServiceAsyncImpl implements ArtistServiceAsync {
    private final ArtistRepository artistRepo;
    private final SearchServiceAsync searchServiceAsync;

    @Override
    public void increasePopularity(UUID artistId) {
        artistRepo.findById(artistId)
                .ifPresent((artist) -> {
                    final Set<String> uris = new HashSet<>();
                    uris.add(ResourceType.mapUri(ARTIST, artistId));
                    searchServiceAsync.increasePopularity(uris);
                });
    }

    @Override
    public void createArtistSearch(UUID artistId) {
        artistRepo.findById(artistId)
                .ifPresent((artist) -> {
                    SearchRequest searchReq = new SearchRequest(
                            artist.getName(),
                            "",
                            artist.getThumbnail(),
                            ARTIST,
                            null);

                    searchServiceAsync.createSearch(searchReq);
                });
    }

}