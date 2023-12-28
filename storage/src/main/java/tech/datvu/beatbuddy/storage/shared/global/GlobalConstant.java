package tech.datvu.beatbuddy.storage.shared.global;

public class GlobalConstant {
    public static final String STORAGE_DIR = System.getProperty("user.home") + "/beatbuddy";
    public static final String STORAGE_PUBLIC_DIR = System.getProperty("user.home") + "/beatbuddy/public";
    public static final String STATUS_SUCCESS = "success";
    public static final String STATUS_ERROR = "error";
    public static final String UNIX_ABSOLUTE_PATH_REGEX = "^/([a-zA-Z0-9_.-]+/?)+[^/]$";

}
