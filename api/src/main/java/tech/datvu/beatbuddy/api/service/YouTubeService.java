package tech.datvu.beatbuddy.api.service;

import tech.datvu.beatbuddy.api.model.YouTubeMetadata;

public interface YouTubeService {
    boolean extractAudioFile(String url, String outFile);

    YouTubeMetadata fetchMetadata(String url);
}