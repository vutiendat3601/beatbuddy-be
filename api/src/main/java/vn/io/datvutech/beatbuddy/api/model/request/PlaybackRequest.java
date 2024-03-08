package vn.io.datvutech.beatbuddy.api.model.request;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

import org.hibernate.validator.constraints.Range;

import jakarta.validation.constraints.NotNull;
import lombok.Data;
import vn.io.datvutech.beatbuddy.api.model.RepeatMode;

@Data
public class PlaybackRequest implements Serializable {
    public interface Update {
    }

    @NotNull(groups = { Update.class })
    private List<UUID> playedTrackIds;

    @NotNull(groups = { Update.class })
    private List<UUID> waitingTrackIds;

    @NotNull(groups = { Update.class })
    private List<UUID> originalPlayedTrackIds;

    @NotNull(groups = { Update.class })
    private List<UUID> originalWaitingTrackIds;

    private float currentSec;

    @Range(groups = { Update.class }, min = 0, max = 1)
    private float volume;

    private UUID trackId;

    private RepeatMode repeatMode;

    private Boolean isShuffled;

    public PlaybackRequest() {
        playedTrackIds = List.of();
        waitingTrackIds = List.of();
        originalPlayedTrackIds = List.of();
        originalWaitingTrackIds = List.of();
        isShuffled = false;
        repeatMode = RepeatMode.NONE;
    }
}
