package tech.datvu.beatbuddy.audio;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import tech.datvu.beatbuddy.audio.models.YoutubeMetadata;

public interface YoutubeService {

    class YoutubeUrl {
        public static String YOUTUBE_URL_REGEX = "^((?:https?:)?\\/\\/)?((?:www|m)\\.)?((?:youtube\\.com|youtu.be))(\\/(?:[\\w\\-]+\\?v=|embed\\/|v\\/)?)([\\w\\-]+)(\\S+)?$";

        private String playlistId;
        private String videoId;

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
    }

    @FunctionalInterface
    interface SingleVideoUrlParser {
        String getVideoId(String url);
    }

    @FunctionalInterface
    interface PlaylistUrlParser {
        String getPlaylistId(String url);
    }

    SingleVideoUrlParser[] singleVideoParsers = { (url) -> {
        final String YOUTU_BE_REGEX = "youtu.be/[a-zA-Z0-9_-]+";
        Matcher matcher = Pattern.compile(YOUTU_BE_REGEX).matcher(url);
        if (matcher.find()) {
            return matcher.group().replace("youtu.be/", "");
        }
        return null;
    }, (url) -> {
        final String YOUTUBE_COM_REGEX = "v=[a-zA-Z0-9_-]+";
        Matcher matcher = Pattern.compile(YOUTUBE_COM_REGEX).matcher(url);
        if (matcher.find()) {
            return matcher.group().replace("v=", "");
        }
        return null;
    } };

    PlaylistUrlParser[] playlistUrlParsers = { (url) -> {
        final String PLAYLIST_REGEX = "list=[a-zA-Z0-9_-]+";
        Matcher matcher = Pattern.compile(PLAYLIST_REGEX).matcher(url);
        if (matcher.find()) {
            return matcher.group().replace("list=", "");
        }
        return null;
    } };

    static YoutubeUrl parseYoutubeLink(String url) {
        if (!isYoutubeUrl(url)) {
            return null;
        }
        YoutubeUrl youtubeUrl = new YoutubeUrl();
        for (SingleVideoUrlParser singleVideoParsers : singleVideoParsers) {
            String vidId = singleVideoParsers.getVideoId(url);
            if (vidId != null) {
                youtubeUrl.setVideoId(vidId);
                break;
            }
        }
        for (PlaylistUrlParser playlistUrlParser : playlistUrlParsers) {
            String playlistId = playlistUrlParser.getPlaylistId(url);
            if (playlistId != null) {
                youtubeUrl.setPlaylistId(playlistId);
                break;
            }
        }
        return youtubeUrl;
    }

    static boolean isYoutubeUrl(String url) {
        return url != null && url.matches(YoutubeUrl.YOUTUBE_URL_REGEX);
    }

    boolean extractAudioFile(String url, String outFile);

    YoutubeMetadata fetchMetadata(String url);
}