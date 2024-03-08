package vn.io.datvutech.beatbuddy.api.model;

import com.fasterxml.jackson.annotation.JsonValue;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

public enum RepeatMode {
    NONE, ONCE, ALL;

    @JsonValue
    public String json() {
        return name().toLowerCase();
    }

    @Converter(autoApply = true)
    public static class RepeatModeConverter implements AttributeConverter<RepeatMode, String> {
        @Override
        public String convertToDatabaseColumn(RepeatMode status) {
            return status == null ? null : status.json();
        }

        @Override
        public RepeatMode convertToEntityAttribute(String dbData) {
            return dbData == null ? null : RepeatMode.valueOf(dbData.toUpperCase());
        }
    }
}