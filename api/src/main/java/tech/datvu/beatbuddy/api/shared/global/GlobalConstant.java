package tech.datvu.beatbuddy.api.shared.global;

public class GlobalConstant {
    public static final String AUDIO_FORMAT = "mp3";
    public static final String LYRICS_FORMAT = "lrc";
    public static final String STORAGE_DIR = System.getProperty("user.home") + "/beatbuddy";
    public static final String STORAGE_PUBLIC_DIR = System.getProperty("user.home") + "/beatbuddy/public";
    public static final String YOUTUBE_FILENAME_PREFIX = "ytb_";
    public static final String STATUS_SUCCESS = "success";
    public static final String STATUS_PENDING = "pending";
    public static final String STATUS_HANDLED = "handled";
    public static final String STATUS_ERROR = "error";
    public static final String FILE_TYPE_AUDIO = "audio";
    public static final String FILE_TYPE_LYRICS = "lyrics";
    public static final String FILE_TYPE_IMAGE = "image";
    public static final String FILE_TYPE_PUBLIC = "public";
    public static final String TRACK_REQ_THUMB_FILENAME_PREFIX = "trackreqthumb_";
    public static final String TRACK_REQ_LYRICS_FILENAME_PREFIX = "trackreqlyrics_";
}
