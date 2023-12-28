package tech.datvu.beatbuddy.api.resource.models;

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
    private String urn;

    private String tags;

    private String thumbnail;

    private ResourceType type;

    @JsonProperty("id")
    public String id() {
        return urn == null ? null : urn.split(":")[1];
    }

    @JsonProperty("type")
    public String type() {
        return type == null ? null : type.name().toLowerCase();
    }
}