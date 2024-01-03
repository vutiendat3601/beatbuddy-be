package tech.datvu.beatbuddy.storage.audio;

import tech.datvu.beatbuddy.storage.shared.global.GlobalException;

public enum AudioException {
    AUDIO_FILE_NOT_FOUND(new GlobalException("404", "Audio file not found")),
    AUDIO_CREATE_SEGMENT_ERROR(new GlobalException("AU001", "Audio create segment error")),
    M3U8_DUPLICATION(new GlobalException("409", "M3U8 file was existed"));

    private GlobalException instance;

    private AudioException(GlobalException instance) {
        this.instance = instance;
    }

    public GlobalException instance() {
        return instance;
    }
}
