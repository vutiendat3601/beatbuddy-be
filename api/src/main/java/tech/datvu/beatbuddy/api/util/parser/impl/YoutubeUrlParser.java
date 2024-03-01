package tech.datvu.beatbuddy.api.util.parser.impl;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import tech.datvu.beatbuddy.api.util.parser.UrlParser;
import tech.datvu.beatbuddy.api.util.parser.YoutubeUrl;

public class YoutubeUrlParser implements UrlParser<YoutubeUrl> {
    private String url;

    private YoutubeUrl youtubeUrl;

    private void parsePlaylistId() {
        final String PLAYLIST_REGEX = "list=[a-zA-Z0-9_-]+";
        Matcher matcher = Pattern.compile(PLAYLIST_REGEX).matcher(url);
        if (matcher.find()) {
            String playlistId = matcher.group().replace("list=", "");
            youtubeUrl.setPlaylistId(playlistId);
        }
    }

    private void parseVideoId() {
        final String YOUTU_BE_REGEX = "youtu.be/[a-zA-Z0-9_-]+";
        Matcher matcher = Pattern.compile(YOUTU_BE_REGEX).matcher(url);
        if (matcher.find()) {
            String videoId = matcher.group().replace("youtu.be/", "");
            youtubeUrl.setVideoId(videoId);
        }
    }

    @Override
    public YoutubeUrl parse(String url) {
        if (YoutubeUrl.isYouTubeUrl(url)) {
            this.url = url;
            youtubeUrl = new YoutubeUrl(url);
            parseVideoId();
            parsePlaylistId();
            return youtubeUrl;
        }
        return null;
    }
}
