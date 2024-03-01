package tech.datvu.beatbuddy.api.dto;

import static tech.datvu.beatbuddy.api.global.GlobalConstant.BB;
import static tech.datvu.beatbuddy.api.global.GlobalConstant.PLAYLIST;

import java.util.List;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Builder
@JsonPropertyOrder({
        "id",
        "name",
        "description",
        "durationSec",
        "thumbnail",
        "isPublic",
        "uri",
        "owner",
        "createdBy",
        "updatedBy",
        "createdAt",
        "updatedAt",
        "tracks"
})
@AllArgsConstructor
@Data
@EqualsAndHashCode(callSuper = true)
public class PlaylistDto extends TrackingDto {
    private UUID id;

    private String name;

    @JsonProperty("isPublic")
    private boolean isPublic;

    private String description;

    private long durationSec;

    private String thumbnail;

    private List<TrackDto> tracks;

    @JsonProperty("uri")
    public String uri() {
        return "%s:%s:%s".formatted(BB, PLAYLIST, id);
    }

    public PlaylistDto() {
        tracks = List.of();
    }
}
