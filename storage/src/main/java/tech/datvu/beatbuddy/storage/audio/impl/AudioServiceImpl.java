package tech.datvu.beatbuddy.storage.audio.impl;

import static tech.datvu.beatbuddy.storage.shared.global.GlobalConstant.AUDIO_SEGMENT_FORMAT;
import static tech.datvu.beatbuddy.storage.shared.global.GlobalConstant.STORAGE_DIR;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import tech.datvu.beatbuddy.storage.audio.AudioException;
import tech.datvu.beatbuddy.storage.audio.AudioService;
import tech.datvu.beatbuddy.storage.audio.models.AudioSegmentRequest;

@Slf4j
@Service
public class AudioServiceImpl implements AudioService {
    private static final String[] FFMPEG_SEGMENT_CMD = {
            "ffmpeg", // 0
            "-i", // 1
            STORAGE_DIR, // 2
            "-vn", // 3
            "-acodec", // 4
            "mp3", // 5
            "-hls_time", // 6
            "3", // 7
            "-b:a", // 8
            "128k", // 9
            "-hls_key_info_file", // 10
            "mp3segmentkey.info", // 11
            "-hls_playlist_type", // 12
            "vod", // 13
            "-f", // 14
            "hls", // 15
            "-hls_segment_filename", // 16
            "", // 17
            ""// 18
    };
    private static final int INP_ARG = 2;
    private static final int BITRATE_ARG = 9;
    private static final int SEGMENT_FILE_NAME_ARG = 17;
    private static final int M3U8_FILE_ARG = 18;

    public boolean createSegment(AudioSegmentRequest audioSegReq) {
        String audioFile = STORAGE_DIR + audioSegReq.getAudioPath();
        log.info("Create audio segment: " + audioFile);
        if (!Files.exists(Path.of(audioFile))) {
            throw AudioException.AUDIO_FILE_NOT_FOUND.instance();
        }
        String m3u8File = STORAGE_DIR + audioSegReq.getM3u8Path();
        Path m3u8Path = Path.of(m3u8File);
        if (Files.exists(m3u8Path)) {
            throw AudioException.M3U8_DUPLICATION.instance();
        }
        String simpleFileName = Path.of(m3u8File).getFileName() + "";
        simpleFileName = simpleFileName.substring(0, simpleFileName.indexOf("."));
        String segmentFile = "%s/%s_seq%%03d.%s".formatted(m3u8Path.getParent(), simpleFileName, AUDIO_SEGMENT_FORMAT);
        FFMPEG_SEGMENT_CMD[INP_ARG] = audioFile;
        FFMPEG_SEGMENT_CMD[BITRATE_ARG] = audioSegReq.getQuality().value() + "k";
        FFMPEG_SEGMENT_CMD[SEGMENT_FILE_NAME_ARG] = segmentFile;
        FFMPEG_SEGMENT_CMD[M3U8_FILE_ARG] = m3u8File;
        int exitCode = 0;
        log.info(Arrays.toString(FFMPEG_SEGMENT_CMD));
        ProcessBuilder processBuilder = new ProcessBuilder(FFMPEG_SEGMENT_CMD);
        processBuilder.directory(new File(STORAGE_DIR));
        processBuilder.redirectErrorStream(true);
        try {
            Files.createDirectories(m3u8Path.getParent());
            Process process = processBuilder.start();
            BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line = null;
            while ((line = br.readLine()) != null) {
                log.info(line);
            }
            exitCode = process.waitFor();
            if (exitCode != 0) {
                throw AudioException.AUDIO_CREATE_SEGMENT_ERROR.instance();
            }
            if (audioSegReq.getDeleteFileAfterSplitted()) {
                Files.deleteIfExists(Path.of(audioFile));
            }
        } catch (IOException | InterruptedException e) {
            log.error(e.getMessage(), e);
        } finally {
            FFMPEG_SEGMENT_CMD[INP_ARG] = STORAGE_DIR;
            FFMPEG_SEGMENT_CMD[SEGMENT_FILE_NAME_ARG] = "";
            FFMPEG_SEGMENT_CMD[M3U8_FILE_ARG] = "";
        }
        return true;
    }

}
