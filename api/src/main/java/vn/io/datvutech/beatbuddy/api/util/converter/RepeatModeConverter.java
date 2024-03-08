package vn.io.datvutech.beatbuddy.api.util.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

import vn.io.datvutech.beatbuddy.api.model.RepeatMode;


@Component
public class RepeatModeConverter implements Converter<String, RepeatMode> {

    @Override
    @Nullable
    public RepeatMode convert(String source) {
        return source == null ? null : RepeatMode.valueOf(source.toUpperCase());
    }

}
