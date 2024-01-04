package tech.datvu.beatbuddy.api.shared.services.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import tech.datvu.beatbuddy.api.audio.models.Audio.AudioQuality;


@Data
@AllArgsConstructor
public class AudioSegmentRequest {
    private String audioPath;

    private String m3u8Path;

    private Boolean deleteFileAfterSplitted;

    private AudioQuality quality;

    public AudioSegmentRequest() {
        deleteFileAfterSplitted = false;
        quality = AudioQuality.KBPS128;
    }
}
