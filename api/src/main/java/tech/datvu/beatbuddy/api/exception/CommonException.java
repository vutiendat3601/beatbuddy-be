package tech.datvu.beatbuddy.api.exception;

public enum CommonException {
    MEDIA_TYPE_NOT_SUPPORTED(new GlobalException(
            "415", "Media type not supported")),
    ISO_COUNTRY_CODE_NOT_FOUND(new GlobalException("404", "Country code not found")),
    BAD_PAGE_REQUEST(new GlobalException("400",
            "Invalid page offset, page offset (page * size) must be between 0 and " + Integer.MAX_VALUE)),
    INTERNAL_SERVER_ERROR(new GlobalException("500", "Internal server error")),
    BAD_REQUEST(new GlobalException("400", "Bad request"));

    private GlobalException instance;

    private CommonException(GlobalException instance) {
        this.instance = instance;
    }

    public GlobalException instance() {
        return instance;
    }
}
