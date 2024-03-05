package tech.datvu.beatbuddy.api.model;

import static tech.datvu.beatbuddy.api.global.GlobalConstant.BB;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonValue;

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
}