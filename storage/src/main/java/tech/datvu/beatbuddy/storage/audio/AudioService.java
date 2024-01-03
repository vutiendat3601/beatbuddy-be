package tech.datvu.beatbuddy.storage.audio;

import tech.datvu.beatbuddy.storage.audio.models.AudioSegmentRequest;

public interface AudioService {
    boolean createSegment(AudioSegmentRequest file);
}
