package tech.datvu.beatbuddy.api.audio.impl;

import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.AUDIO_FORMAT;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.FILE_TYPE_AUDIO;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.STORAGE_DIR;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import tech.datvu.beatbuddy.api.audio.AudioRepo;
import tech.datvu.beatbuddy.api.audio.AudioServiceAsync;
import tech.datvu.beatbuddy.api.audio.YouTubeService;
import tech.datvu.beatbuddy.api.audio.models.Audio;
import tech.datvu.beatbuddy.api.audio.models.YouTubeMetadata;
import tech.datvu.beatbuddy.api.file.FileServiceAsync;
import tech.datvu.beatbuddy.api.shared.utils.FileUtil;

@Slf4j
@Service
@RequiredArgsConstructor
public class AudioServiceAsyncImpl implements AudioServiceAsync {
    // ## Services
    private final YouTubeService ytService;

    // ## Repos
    private final AudioRepo audioRepo;
    private final FileServiceAsync fileServiceAsync;

    @Override
    public void saveYouTubeAudio(String url, String audioCode) {
        if (!YouTubeService.isYouTubeUrl(url) || audioCode == null) {
            return;
        }
        Audio audio = audioRepo.findByCode(audioCode).orElse(null);
        if (audio == null) {
            String outFile = "%s/%s/%s.%s".formatted(STORAGE_DIR, FILE_TYPE_AUDIO, audioCode, AUDIO_FORMAT);
            boolean isSaved = ytService.extractAudioFile(url, outFile);
            final Path outFilePath = Path.of(outFile);
            if (isSaved && Files.exists(outFilePath)) {
                String hashMd5 = FileUtil.hashMd5(outFile);
                String simpleFileName = "%s.%s".formatted(hashMd5, AUDIO_FORMAT);
                final String hashMd5OutFile = "%s/%s".formatted(outFilePath.getParent(), simpleFileName);
                outFilePath.toFile().renameTo(new File(hashMd5OutFile));
                outFile = "/%s/%s".formatted(FILE_TYPE_AUDIO, simpleFileName);
                YouTubeMetadata ytMetadata = ytService.fetchMetadata(url);
                audio = Audio.builder()
                        .code(audioCode)
                        .originalUrl(ytMetadata.getOriginalUrl())
                        .file(outFile)
                        .releasedDate(ytMetadata.getUploadDate())
                        .hashMd5(hashMd5)
                        .build();
                audioRepo.save(audio);
                try {
                    fileServiceAsync.saveFile(new FileInputStream(hashMd5OutFile), outFile, false);
                } catch (FileNotFoundException e) {
                    log.error(e.getMessage(), e);
                }
            }
        }
    }

}
