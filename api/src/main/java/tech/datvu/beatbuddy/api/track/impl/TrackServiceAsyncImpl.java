package tech.datvu.beatbuddy.api.track.impl;

import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.AUDIO_FORMAT;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.FILE_TYPE_AUDIO;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.FILE_TYPE_PUBLIC;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.M3U8_FORMAT;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.SEARCH_ANALYSIS_TXT;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.STORAGE_DIR;

import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.audio.AudioRepo;
import tech.datvu.beatbuddy.api.audio.AudioTrackRepo;
import tech.datvu.beatbuddy.api.audio.models.Audio;
import tech.datvu.beatbuddy.api.audio.models.Audio.AudioQuality;
import tech.datvu.beatbuddy.api.audio.models.AudioTrack;
import tech.datvu.beatbuddy.api.shared.services.BeatBuddyStorageService;
import tech.datvu.beatbuddy.api.shared.services.models.AudioSegmentRequest;
import tech.datvu.beatbuddy.api.shared.utils.FileUtil;
import tech.datvu.beatbuddy.api.shared.utils.TextUtil;
import tech.datvu.beatbuddy.api.track.TrackRepo;
import tech.datvu.beatbuddy.api.track.TrackServiceAsync;
import tech.datvu.beatbuddy.api.track.models.Track;

@RequiredArgsConstructor
@Service
public class TrackServiceAsyncImpl implements TrackServiceAsync {
    private static final String SEARCH_ANALYSIS_FILE = "%s/%s".formatted(STORAGE_DIR, SEARCH_ANALYSIS_TXT);

    // ## Mappers

    // ## Repos
    private final TrackRepo trackRepo;
    private final AudioRepo audioRepo;
    private final AudioTrackRepo audioTrackRepo;
    private final BeatBuddyStorageService beatBuddyStorageService;

    @Override
    public void createTrackAudioSegmentByRefcode(List<UUID> trackIds, AudioQuality quality) {
        if (trackIds == null || trackIds.isEmpty()) {
            return;
        }
        final List<String> refCodesSuccess = new LinkedList<>();
        final List<String> refCodesFail = new LinkedList<>();
        List<Track> tracks = trackRepo.findAllById(trackIds);
        tracks.stream()
                .filter(t -> !t.isPlayable())
                .forEach(t -> {
                    String refCode = t.getRefCode();
                    if (refCode == null) {
                        return;
                    }
                    String audioFile = "/%s/%s.%s".formatted(FILE_TYPE_AUDIO, t.getRefCode(), AUDIO_FORMAT);
                    String hashMd5 = TextUtil.hashMd5(refCode);
                    String m3u8File = "/%s/%s/%s/%s_%s.%s".formatted(
                            FILE_TYPE_PUBLIC,
                            FILE_TYPE_AUDIO,
                            hashMd5,
                            hashMd5,
                            quality.json(),
                            M3U8_FORMAT);
                    boolean isCreatedSegment = beatBuddyStorageService
                            .createAudioSegment(new AudioSegmentRequest(
                                    audioFile,
                                    m3u8File,
                                    true,
                                    quality));

                    if (isCreatedSegment) {
                        refCodesSuccess.add(refCode);

                        // ## Save audio information
                        Audio audio = new Audio(null, refCode, m3u8File, quality);
                        audio = audioRepo.save(audio);

                        // ## Save AudioTrack mapping
                        AudioTrack audioTrack = new AudioTrack(null, audio.getId(), t.getId(), true);
                        audioTrackRepo.save(audioTrack);

                        // ## Save Track to be playable
                        t.setPlayable(true);
                        trackRepo.save(t);
                    } else {
                        refCodesFail.add(refCode);
                    }
                });

        // Write information for analysis
        FileUtil.appendText("Created segment success: %s\n".formatted(refCodesSuccess), SEARCH_ANALYSIS_FILE);
        FileUtil.appendText("Created segment fail: %s\n\n".formatted(refCodesFail), SEARCH_ANALYSIS_FILE);
    }

}
