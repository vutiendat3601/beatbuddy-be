package vn.io.datvutech.beatbuddy.api.util.parser;

public class YoutubeUrl implements ParsableUrl {
    public static String YOUTUBE_URL_REGEX = "^((?:https?:)?\\/\\/)?((?:www|m)\\.)?((?:youtube\\.com|youtu.be))(\\/(?:[\\w\\-]+\\?v=|embed\\/|v\\/)?)([\\w\\-]+)(\\S+)?$";

    private String playlistId;

    private String videoId;

    private String url;

    public YoutubeUrl(String url) {
        this.url = url;
    }

    public String getPlaylistId() {
        return playlistId;
    }

    public void setPlaylistId(String playlistId) {
        this.playlistId = playlistId;
    }

    public String getVideoId() {
        return videoId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }

    public static boolean isYouTubeUrl(String url) {
        return url != null && url.matches(YOUTUBE_URL_REGEX);
    }

    @Override
    public String getId() {
        return videoId;
    }

    @Override
    public UrlType getType() {
        return UrlType.YOUTUBE;
    }

    @Override
    public String getUrl() {
        return url;
    }
}
