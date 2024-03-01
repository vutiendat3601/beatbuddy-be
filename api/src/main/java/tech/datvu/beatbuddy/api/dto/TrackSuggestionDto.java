package tech.datvu.beatbuddy.api.dto;

import java.util.List;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import tech.datvu.beatbuddy.api.entity.TrackSuggestion;

@Builder
@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
public class TrackSuggestionDto extends TrackingDto {
    private UUID id;

    private String name;

    private String url;

    private String releasedDate;

    private String description;

    private UUID trackId;

    @JsonIgnore
    private String audioRefCode;

    private TrackSuggestion.Status status;

    private List<ArtistDto> artists;

    public TrackSuggestionDto() {
        artists = List.of();
    }

    @JsonProperty("isPlayable")
    public boolean isPlayable() {
        return audioRefCode != null;
    }

    @Builder
    @Data
    public static class ArtistDto {
        private UUID id;

        private String nickName;

        @JsonProperty("isPublic")
        private boolean isPublic;

        private String avatar;
    }
}
