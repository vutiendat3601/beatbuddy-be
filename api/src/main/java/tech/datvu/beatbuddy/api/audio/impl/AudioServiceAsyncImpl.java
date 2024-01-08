package tech.datvu.beatbuddy.api.audio.impl;

import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.AUDIO_FORMAT;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.FILE_TYPE_AUDIO;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.STORAGE_DIR;

import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.audio.AudioRepo;
import tech.datvu.beatbuddy.api.audio.AudioServiceAsync;
import tech.datvu.beatbuddy.api.audio.YouTubeService;
import tech.datvu.beatbuddy.api.audio.models.Audio;
import tech.datvu.beatbuddy.api.file.FileServiceAsync;
import tech.datvu.beatbuddy.api.shared.utils.FileUtil;

@Service
@RequiredArgsConstructor
public class AudioServiceAsyncImpl implements AudioServiceAsync {
    // ## Services
    private final YouTubeService ytService;

    // ## Repos
    private final AudioRepo audioRepo;
    private final FileServiceAsync fileServiceAsync;

    @Override
    public void saveYouTubeAudio(String url, String audioRefCode) {
        if (!YouTubeService.isYouTubeUrl(url) || audioRefCode == null) {
            return;
        }
        Audio audio = audioRepo.findByRefCode(audioRefCode).orElse(null);
        if (audio == null) {
            String tmpOutFile = "%s/%s/%s.%s".formatted(STORAGE_DIR, FILE_TYPE_AUDIO, audioRefCode, AUDIO_FORMAT);
            boolean isSaved = ytService.extractAudioFile(url, tmpOutFile);
            if (isSaved && Files.exists(Path.of(tmpOutFile))) {
                String hashMd5 = FileUtil.hashMd5(tmpOutFile);
                audio = Audio.builder()
                        .refCode(audioRefCode)
                        .url(tmpOutFile)
                        .build();
                audioRepo.save(audio);
                String storageFilePath = "/%s/%s.%s".formatted(FILE_TYPE_AUDIO, hashMd5, AUDIO_FORMAT);
                fileServiceAsync.saveFileToStorage(tmpOutFile, storageFilePath, true);
            }
        }
    }

}
