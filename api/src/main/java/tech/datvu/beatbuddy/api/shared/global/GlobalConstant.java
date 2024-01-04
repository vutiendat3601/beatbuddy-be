package tech.datvu.beatbuddy.api.shared.global;

public class GlobalConstant {
    public static final String AUDIO_FORMAT = "mp3";
    public static final String LYRICS_FORMAT = "lrc";
    public static final String M3U8_FORMAT = "m3u8";
    public static final String STORAGE_DIR = System.getProperty("user.home") + "/beatbuddy";
    public static final String STORAGE_PUBLIC_DIR = System.getProperty("user.home") + "/beatbuddy/public";
    public static final String YOUTUBE_REF_CODE_PREFIX = "ytb_";
    public static final String SPOTIFY_REF_CODE_PREFIX = "spt_";
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
    public static final String STATIC_BASE_URL = "http://beatbuddystatic.datvu.tech";
    public static final String URL_REGEX = "^https?:\\/\\/(?:www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b(?:[-a-zA-Z0-9()@:%_\\+.~#?&\\/=]*)$";
    public static final String SEARCH_ANALYSIS_TXT = "search_analysis.txt";
}
