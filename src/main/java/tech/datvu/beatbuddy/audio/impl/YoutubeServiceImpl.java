package tech.datvu.beatbuddy.audio.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import tech.datvu.beatbuddy.audio.YoutubeException;
import tech.datvu.beatbuddy.audio.YoutubeService;
import tech.datvu.beatbuddy.audio.models.YoutubeMetadata;

@Slf4j
@Service
public class YoutubeServiceImpl implements YoutubeService {
    private static final String[] FETCH_CMD = { "yt", "-j", "--no-playlist", "" };
    private static final int FETCH_URL_ARG = 3;

    private static final String[] EXTRACT_AUDIO_CMD = {
            "yt", "-x", "--no-playlist", "--audio-quality", "0",
            "-o", "ytb_%(id)s", "--audio-format", "mp3", "" };
    private static final int EXTRACT_AUDIO_OUT_ARG = 6;
    private static final int EXTRACT_AUDIO_FORMAT_ARG = 8;
    private static final int EXTRACT_AUDIO_URL_ARG = 9;

    @Override
    public boolean extractAudioFile(String url, String outFile) {
        int exitCode = 0;
        try {
            EXTRACT_AUDIO_CMD[EXTRACT_AUDIO_URL_ARG] = url;
            if (outFile != null) {
                EXTRACT_AUDIO_CMD[EXTRACT_AUDIO_OUT_ARG] = outFile;
            }
            ProcessBuilder processBuilder = new ProcessBuilder(EXTRACT_AUDIO_CMD);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            try (BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                String line;
                while ((line = br.readLine()) != null) {
                    log.info(line);
                }
            }
            exitCode = process.waitFor();
        } catch (IOException | InterruptedException e) {
            log.error(e.getMessage());
        } finally {
            EXTRACT_AUDIO_CMD[EXTRACT_AUDIO_OUT_ARG] = "ytb_%(id)s";
            EXTRACT_AUDIO_CMD[EXTRACT_AUDIO_FORMAT_ARG] = "mp3";
            EXTRACT_AUDIO_CMD[EXTRACT_AUDIO_URL_ARG] = "";
        }
        return exitCode == 0 || Files.exists(Path.of(outFile));
    }

    @Override
    public YoutubeMetadata fetchMetadata(String url) {
        try {
            FETCH_CMD[FETCH_URL_ARG] = url;
            log.info("Fetching youtube metadata: " + Arrays.toString(FETCH_CMD));
            ProcessBuilder processBuilder = new ProcessBuilder(FETCH_CMD);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            String resp = new String(process.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
            process.getInputStream().close();
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                ObjectMapper objectMapper = new ObjectMapper();
                YoutubeMetadata ytMetadata = objectMapper.readValue(resp, YoutubeMetadata.class);
                return ytMetadata;
            }
        } catch (IOException | InterruptedException e) {
            log.error(e.getMessage());
        } finally {
            FETCH_CMD[FETCH_URL_ARG] = "";
        }
        throw YoutubeException.FETCH_ERROR.instance();
    }
}