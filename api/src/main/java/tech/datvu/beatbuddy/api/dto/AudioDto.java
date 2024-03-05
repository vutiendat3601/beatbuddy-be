package tech.datvu.beatbuddy.api.dto;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import tech.datvu.beatbuddy.api.entity.Audio.AudioQuality;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AudioDto {
    private UUID id;

    private AudioQuality quality;

    private String path;
}
