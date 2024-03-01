package tech.datvu.beatbuddy.api.dto;

import java.time.ZonedDateTime;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;
import tech.datvu.beatbuddy.api.entity.AbstractEntity;

@Data
@NoArgsConstructor
public class TrackingDto {
    @JsonIgnore
    protected ZonedDateTime createdAt;

    @JsonIgnore
    protected ZonedDateTime updatedAt;

    protected String createdBy;

    protected String updatedBy;

    @JsonProperty("createdAt")
    public long createdAt() {
        return createdAt == null ? -1 : createdAt.toEpochSecond();
    }

    @JsonProperty("updatedAt")
    public long updatedAt() {
        return createdAt == null ? -1 : createdAt.toEpochSecond();
    }

    public static void map(TrackingDto trackingEntity, AbstractEntity entity) {
        trackingEntity.setCreatedAt(entity.getCreatedAt());
        trackingEntity.setUpdatedAt(entity.getUpdatedAt());
        trackingEntity.setCreatedBy(entity.getCreatedBy());
        trackingEntity.setUpdatedBy(entity.getUpdatedBy());
    }
}
