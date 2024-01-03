package tech.datvu.beatbuddy.storage.shared.global;

public class GlobalConstant {
    public static final String STORAGE_DIR = System.getProperty("user.home") + "/beatbuddy";
    public static final String STORAGE_PUBLIC_DIR = System.getProperty("user.home") + "/beatbuddy/public";
    public static final String STATUS_SUCCESS = "success";
    public static final String STATUS_ERROR = "error";
    public static final String UNIX_ABSOLUTE_PATH_REGEX = "^/([a-zA-Z0-9_.-]+/?)+[^/]$";
    public static final String MD5_REGEX = "^[a-fA-F0-9]{32}$";
    public static final String FILE_TYPE_AUDIO = "audio";
    public static final String AUDIO_FORMAT = "mp3";
    public static final String AUDIO_SEGMENT_FORMAT = "ts";
    public static final String AUDIO_M3U8_FORMAT = "m3u8";
}
