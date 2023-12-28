package tech.datvu.beatbuddy.api.audio;

import org.springframework.scheduling.annotation.Async;

@Async("backgroundTask")
public interface AudioServiceAsync {
    void saveYouTubeAudio(String url, String audioCode);
}
