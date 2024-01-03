package tech.datvu.beatbuddy.api.resource.models;

import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.STATIC_BASE_URL;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.URL_REGEX;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import tech.datvu.beatbuddy.api.resource.models.Resource.ResourceType;

@JsonPropertyOrder("id")
@Builder
@Data
@AllArgsConstructor
public class ResourceDto {
    @JsonIgnore
    private UUID id;

    private String name;

    @JsonIgnore
    private String uri;

    private String tags;

    @JsonIgnore
    private String thumbnail;

    private ResourceType type;

    @JsonProperty("id")
    public String id() {
        return uri == null ? null : uri.split(":")[1];
    }

    public String thumbnail() {
        return thumbnail == null
                ? null
                : thumbnail.matches(URL_REGEX)
                        ? thumbnail
                        : STATIC_BASE_URL + thumbnail;

    }

}