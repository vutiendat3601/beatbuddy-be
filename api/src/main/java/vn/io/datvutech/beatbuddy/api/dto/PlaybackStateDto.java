package vn.io.datvutech.beatbuddy.api.dto;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlaybackStateDto {
    private float currentSec;

    private float volume;

    private TrackDto track;

    @JsonIgnore
    private UUID trackId;
}
