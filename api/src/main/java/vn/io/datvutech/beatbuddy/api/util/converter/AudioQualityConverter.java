package vn.io.datvutech.beatbuddy.api.util.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import vn.io.datvutech.beatbuddy.api.entity.Audio.AudioQuality;

@Component
public class AudioQualityConverter implements Converter<String, AudioQuality> {

    @Override
    public AudioQuality convert(String source) {
        return source == null ? null : AudioQuality.valueOf(source.toUpperCase());
    }

}
