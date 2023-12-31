package tech.datvu.beatbuddy.api.shared.utils.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import tech.datvu.beatbuddy.api.audio.models.Audio.AudioQuality;

@Component
public class AudioQualityConverter implements Converter<String, AudioQuality> {

    @Override
    public AudioQuality convert(String source) {
        return source == null ? null : AudioQuality.valueOf(source.toUpperCase());
    }

}
