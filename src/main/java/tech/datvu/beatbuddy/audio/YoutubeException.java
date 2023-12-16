package tech.datvu.beatbuddy.audio;

import tech.datvu.beatbuddy.shared.GlobalException;

public enum YoutubeException {
    FETCH_ERROR(new GlobalException("YT001", "Fetch Youtube metadata error"));

    private GlobalException instance;

    private YoutubeException(GlobalException instance) {
        this.instance = instance;
    }

    public GlobalException instance() {
        return instance;
    }
}
