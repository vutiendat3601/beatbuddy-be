package tech.datvu.beatbuddy.api.dto;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import lombok.AllArgsConstructor;
import lombok.Data;
import tech.datvu.beatbuddy.api.entity.Audio.AudioQuality;

@AllArgsConstructor
@Data
public class TrackStreamDto {
    private Map<AudioQuality, List<String>> links;

    public TrackStreamDto() {
        links = new HashMap<>();
        for (AudioQuality quality : AudioQuality.values()) {
            links.put(quality, new LinkedList<>());
        }
    }
}
