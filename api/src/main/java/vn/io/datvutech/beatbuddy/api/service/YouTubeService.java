package vn.io.datvutech.beatbuddy.api.service;

import vn.io.datvutech.beatbuddy.api.model.YouTubeMetadata;

public interface YouTubeService {
    boolean extractAudioFile(String url, String outFile);

    YouTubeMetadata fetchMetadata(String url);
}