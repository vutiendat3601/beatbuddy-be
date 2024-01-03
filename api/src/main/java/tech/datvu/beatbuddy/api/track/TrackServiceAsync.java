package tech.datvu.beatbuddy.api.track;

import java.util.List;
import java.util.UUID;

import org.springframework.scheduling.annotation.Async;

import tech.datvu.beatbuddy.api.audio.models.Audio.AudioQuality;

@Async
public interface TrackServiceAsync {
    void createTrackAudioSegmentByRefcode(List<UUID> trackIds, AudioQuality quality);
}
