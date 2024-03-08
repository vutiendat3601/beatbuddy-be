package vn.io.datvutech.beatbuddy.api.exception;

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
