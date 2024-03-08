package vn.io.datvutech.beatbuddy.api.service.impl;

import static vn.io.datvutech.beatbuddy.api.entity.Audio.AudioQuality.KBPS320;
import static vn.io.datvutech.beatbuddy.api.global.GlobalConstant.AUDIO_FORMAT;
import static vn.io.datvutech.beatbuddy.api.global.GlobalConstant.FILE_TYPE_AUDIO;
import static vn.io.datvutech.beatbuddy.api.global.GlobalConstant.STORAGE_DIR;

import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.entity.Audio;
import vn.io.datvutech.beatbuddy.api.repository.AudioRepository;
import vn.io.datvutech.beatbuddy.api.service.AudioServiceAsync;
import vn.io.datvutech.beatbuddy.api.service.YouTubeService;
import vn.io.datvutech.beatbuddy.api.util.UserContext;
import vn.io.datvutech.beatbuddy.api.util.parser.YoutubeUrl;

@Service
@RequiredArgsConstructor
public class AudioServiceAsyncImpl implements AudioServiceAsync {
    // ## Services
    private final YouTubeService ytService;

    // ## Repos
    private final AudioRepository audioRepo;

    @Override
    public void saveYouTubeAudio(String url, String refCode) {
        if (YoutubeUrl.isYouTubeUrl(url) && refCode != null) {
            Audio audio = audioRepo.findByRefCode(refCode).orElse(null);
            if (audio == null) {
                final String STORAGE_FILE_PATH = "/%s/%s.%s".formatted(FILE_TYPE_AUDIO, refCode, AUDIO_FORMAT);
                String tmpOutFile = "%s%s".formatted(STORAGE_DIR, STORAGE_FILE_PATH);
                boolean isSaved = ytService.extractAudioFile(url, tmpOutFile);
                if (isSaved && Files.exists(Path.of(tmpOutFile))) {
                    UserContext.setUsername(UserContext.BOT);
                    audio = Audio.builder()
                            .refCode(refCode)
                            .path(STORAGE_FILE_PATH)
                            .quality(KBPS320)
                            .build();
                    audioRepo.save(audio);
                }
            }
        }
    }

}
