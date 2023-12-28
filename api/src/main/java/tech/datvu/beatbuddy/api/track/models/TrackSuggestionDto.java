package tech.datvu.beatbuddy.api.track.models;

import java.time.ZonedDateTime;
import java.util.List;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
@AllArgsConstructor
public class TrackSuggestionDto {
    private UUID id;

    private String title;

    private String url;

    private String releasedDate;

    private String description;

    @JsonIgnore
    private String tempAudioCode;

    @JsonIgnore
    private String audioCode;

    @JsonIgnore
    private ZonedDateTime createdAt;

    @JsonIgnore
    private ZonedDateTime updatedAt;

    private String createdBy;

    private TrackSuggestion.Status status;

    private List<ArtistDto> artists;

    public TrackSuggestionDto() {
        artists = List.of();
    }

    @JsonProperty("createdAt")
    public long createdAt() {
        return createdAt == null ? -1 : createdAt.toEpochSecond();
    }

    @JsonProperty("updatedAt")
    public long updatedAt() {
        return createdAt == null ? -1 : createdAt.toEpochSecond();
    }

    @JsonProperty("isAvailable")
    public boolean isAvailable() {
        return tempAudioCode != null;
    }

    @Builder
    @Data
    public static class ArtistDto {
        private UUID id;

        private String nickName;

        @JsonProperty("isPublic")
        private boolean isPublic;

        private String avatar;

        @JsonProperty("avatar")
        public String avatar() {
            return avatar;
        }
    }
}