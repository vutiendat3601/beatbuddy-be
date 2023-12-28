package tech.datvu.beatbuddy.api.artist;

import tech.datvu.beatbuddy.api.shared.global.GlobalException;

public enum ArtistException {
    ARTIST_NOT_FOUND(new GlobalException("404", "Artist not found"));

    private GlobalException instance;

    private ArtistException(GlobalException instance) {
        this.instance = instance;
    }

    public GlobalException instance() {
        return instance;
    }
}
