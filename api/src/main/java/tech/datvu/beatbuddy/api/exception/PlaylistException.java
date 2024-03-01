package tech.datvu.beatbuddy.api.exception;

public enum PlaylistException {
    PLAYLIST_NOT_FOUND(new GlobalException("404", "Playlist not found"));

    private GlobalException instance;

    private PlaylistException(GlobalException instance) {
        this.instance = instance;
    }

    public GlobalException instance() {
        return instance;
    }
}
