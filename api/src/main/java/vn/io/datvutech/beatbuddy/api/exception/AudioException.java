package vn.io.datvutech.beatbuddy.api.exception;

public enum AudioException {
    AUDIO_NOT_FOUND(new GlobalException("404", "Audio not found"));

    private GlobalException instance;

    private AudioException(GlobalException instance) {
        this.instance = instance;
    }

    public GlobalException instance() {
        return instance;
    }
}
