package tech.datvu.beatbuddy.api.audio;

import tech.datvu.beatbuddy.api.shared.global.GlobalException;

public enum YouTubeException {
    FETCH_ERROR(new GlobalException("YT001", "Fetch YouTube metadata error"));

    private GlobalException instance;

    private YouTubeException(GlobalException instance) {
        this.instance = instance;
    }

    public GlobalException instance() {
        return instance;
    }
}
