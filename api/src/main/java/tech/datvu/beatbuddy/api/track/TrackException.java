package tech.datvu.beatbuddy.api.track;

import tech.datvu.beatbuddy.api.shared.global.GlobalException;

public enum TrackException {
    SUGGEST_TRACK_NOT_FOUND(new GlobalException("404", "Track suggestion not found")),
    SUGGEST_TRACK_REQUESTED(new GlobalException("409", "Track suggestion url was requested"));

    private GlobalException instance;

    private TrackException(GlobalException instance) {
        this.instance = instance;
    }

    public GlobalException instance() {
        return instance;
    }
}
