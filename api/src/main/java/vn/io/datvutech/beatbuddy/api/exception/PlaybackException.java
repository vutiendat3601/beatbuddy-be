package vn.io.datvutech.beatbuddy.api.exception;

public enum PlaybackException {
    NOT_MATCH_TRACK_LIST(new GlobalException("400", "Not match track lists"));

    private GlobalException instance;

    private PlaybackException(GlobalException instance) {
        this.instance = instance;
    }

    public GlobalException instance() {
        return instance;
    }

    public PlaybackException message(String message) {
        instance.setMessage(message);
        return this;
    }
}
