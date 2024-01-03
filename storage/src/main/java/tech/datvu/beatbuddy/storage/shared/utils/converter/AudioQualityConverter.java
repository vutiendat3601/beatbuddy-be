package tech.datvu.beatbuddy.storage.shared.utils.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import tech.datvu.beatbuddy.storage.audio.models.AudioSegmentRequest.AudioQuality;

@Component
public class AudioQualityConverter implements Converter<String, AudioQuality> {
    @Override
    public AudioQuality convert(String source) {
        return source == null ? null : AudioQuality.valueOf(source.toUpperCase());
    }
}
