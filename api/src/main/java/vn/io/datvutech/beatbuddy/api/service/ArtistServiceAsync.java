package vn.io.datvutech.beatbuddy.api.service;

import java.util.UUID;

public interface ArtistServiceAsync {
    void createArtistSearch(UUID artistId);

    void increasePopularity(UUID artistId);
}
