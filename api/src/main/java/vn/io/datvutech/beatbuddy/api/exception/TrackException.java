package vn.io.datvutech.beatbuddy.api.exception;

public enum TrackException {
    TRACK_NOT_FOUND(new GlobalException("404", "Track not found")),
    TRACK_SUGGESTION_NOT_FOUND(new GlobalException("404", "Track suggestion not found")),
    TRACK_SUGGESTION_REQUESTED(new GlobalException("409", "Track suggestion url was requested"));

    private GlobalException instance;

    private TrackException(GlobalException instance) {
        this.instance = instance;
    }

    public GlobalException instance() {
        return instance;
    }
}
