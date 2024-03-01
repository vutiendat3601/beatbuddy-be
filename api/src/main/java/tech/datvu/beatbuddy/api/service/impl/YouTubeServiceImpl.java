package tech.datvu.beatbuddy.api.service.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import tech.datvu.beatbuddy.api.exception.YouTubeException;
import tech.datvu.beatbuddy.api.model.YouTubeMetadata;
import tech.datvu.beatbuddy.api.service.YouTubeService;

@Service
@Slf4j
public class YouTubeServiceImpl implements YouTubeService {
    public static final String[] AUDIO_FORMAT_SUPPORTS = {
            "aac", "alac", "flac", "m4a", "mp3", "opus", "vorbis", "wav" };
    private static final String[] FETCH_CMD = { "yt", "-j", "--no-playlist", "" };
    private static final int FETCH_URL_ARG = 3;

    private static final String[] EXTRACT_AUDIO_CMD = {
            "yt", "-x", "--no-playlist", "--audio-quality", "0",
            "-o", "ytb_%(id)s", "--audio-format", "mp3", "" };
    private static final int EXTRACT_AUDIO_OUT_ARG = 6;
    private static final int EXTRACT_AUDIO_FORMAT_ARG = 8;
    private static final int EXTRACT_AUDIO_URL_ARG = 9;

    @Cacheable(cacheNames = "cache2", key = "{'yt'+#url, #outFile}")
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

    @Cacheable(cacheNames = "cache2", key = "{'yt'+#url}")
    @Override
    public YouTubeMetadata fetchMetadata(String url) {
        try {
            FETCH_CMD[FETCH_URL_ARG] = url;
            log.info("Fetching YouTube metadata: " + Arrays.toString(FETCH_CMD));
            ProcessBuilder processBuilder = new ProcessBuilder(FETCH_CMD);
            processBuilder.redirectErrorStream(true);
            Process process = processBuilder.start();
            String resp = new String(process.getInputStream().readAllBytes(), StandardCharsets.UTF_8);
            process.getInputStream().close();
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                ObjectMapper objectMapper = new ObjectMapper();
                YouTubeMetadata ytMetadata = objectMapper.readValue(resp, YouTubeMetadata.class);
                return ytMetadata;
            }
        } catch (IOException | InterruptedException e) {
            log.error(e.getMessage());
        } finally {
            FETCH_CMD[FETCH_URL_ARG] = "";
        }
        throw YouTubeException.FETCH_ERROR.instance();
    }
}