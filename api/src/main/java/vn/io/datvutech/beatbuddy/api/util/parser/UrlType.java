package vn.io.datvutech.beatbuddy.api.util.parser;

public enum UrlType {
    YOUTUBE("ytb"), SPOTIFY("spt");

    private String value;

    public String value() {
        return value;
    }

    private UrlType(String value) {
        this.value = value;
    }
}
