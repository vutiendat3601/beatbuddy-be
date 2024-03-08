package vn.io.datvutech.beatbuddy.api.dto;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Builder
@AllArgsConstructor
public class PlaybackDto {
    private UUID id;

    private UUID queueId;

    private UUID playbackStateId;

    private UUID ownerId;

    private QueueDto queue;

    @JsonProperty("state")
    private PlaybackStateDto playbackState;
}
