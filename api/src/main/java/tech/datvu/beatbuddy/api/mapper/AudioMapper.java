package tech.datvu.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import tech.datvu.beatbuddy.api.dto.AudioDto;
import tech.datvu.beatbuddy.api.entity.Audio;

@Component
public class AudioMapper {
    public AudioDto mapToAudioDto(Audio audio) {
        return audio == null
                ? null
                : AudioDto.builder()
                        .id(audio.getId())
                        .quality(audio.getQuality())
                        .path(audio.getPath())
                        .build();
    }
}
