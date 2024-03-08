package vn.io.datvutech.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import vn.io.datvutech.beatbuddy.api.dto.AudioDto;
import vn.io.datvutech.beatbuddy.api.entity.Audio;

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
