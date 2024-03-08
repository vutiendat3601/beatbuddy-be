package vn.io.datvutech.beatbuddy.api.service;

import org.springframework.scheduling.annotation.Async;

@Async("backgroundTask")
public interface AudioServiceAsync {
    void saveYouTubeAudio(String url, String audioCode);
}
