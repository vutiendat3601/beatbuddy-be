package tech.datvu.beatbuddy.api.shared.utils.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Component;

import tech.datvu.beatbuddy.api.search.models.Search.ResourceType;

@Component
public class ResourceTypeConverter implements Converter<String, ResourceType> {
    
    @Override
    @Nullable
    public ResourceType convert(String source) {
        return source == null ? null : ResourceType.valueOf(source.toUpperCase());
    }

}
