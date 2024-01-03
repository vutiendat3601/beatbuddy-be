package tech.datvu.beatbuddy.api.track.models;

import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import tech.datvu.beatbuddy.api.audio.models.Audio.AudioQuality;

@AllArgsConstructor
@Data
public class TrackStreamDto {
    private String fileName;

    private Map<AudioQuality, String> links;

    public TrackStreamDto() {
        links = Map.of();
    }
}
