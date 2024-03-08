package vn.io.datvutech.beatbuddy.api.model;

import static vn.io.datvutech.beatbuddy.api.global.GlobalConstant.BB;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonValue;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

public enum ResourceType {
    ARTIST, TRACK;

    public static String mapUri(ResourceType type, UUID id) {
        return (type == null || id == null)
                ? null
                : "%s:%s:%s".formatted(BB, type.json(), id);
    }

    @JsonValue
    public String json() {
        return name().toLowerCase();
    }

    @Converter(autoApply = true)
    public static class ResourceTypeConverter implements AttributeConverter<ResourceType, String> {
        @Override
        public String convertToDatabaseColumn(ResourceType type) {
            return type == null ? null : type.json();
        }

        @Override
        public ResourceType convertToEntityAttribute(String dbData) {
            return dbData == null ? null : ResourceType.valueOf(dbData.toUpperCase());
        }
    }
}