package tech.datvu.beatbuddy.api.track.models;

import java.util.List;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import tech.datvu.beatbuddy.api.artist.models.ArtistDto;

@JsonPropertyOrder({
        "id", "name", "isPublic",
        "description", "releasedDate", "durationSec",
        "thumbnail", "isPlayable", "artists" })
@Data
@AllArgsConstructor
@Builder
public class TrackDto {
    private UUID id;

    @JsonIgnore
    private String refCode;

    private String name;

    @JsonProperty("isPublic")
    private boolean isPublic;

    private String description;

    private String releasedDate;

    private Long durationSec;

    private String thumbnail;

    @JsonProperty("isPlayable")
    private boolean isPlayable;

    private List<ArtistDto> artists;

    public TrackDto() {
        artists = List.of();
    }
}
