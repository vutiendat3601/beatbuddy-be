package vn.io.datvutech.beatbuddy.api.dto;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import vn.io.datvutech.beatbuddy.api.model.RepeatMode;

@AllArgsConstructor
@Builder
@Data
public class QueueDto {
    private List<TrackDto> playedTracks;

    private List<TrackDto> waitingTracks;

    private OriginalTrackList originals;

    private RepeatMode repeatMode;

    @Data
    public static class OriginalTrackList {
        private List<TrackDto> playedTracks;

        private List<TrackDto> waitingTracks;

        public OriginalTrackList() {
            playedTracks = List.of();
            waitingTracks = List.of();
        }

        public OriginalTrackList(List<TrackDto> playedTracks, List<TrackDto> waitingTracks) {
            this.playedTracks = playedTracks;
            this.waitingTracks = waitingTracks;
        }
        
    }

    @JsonProperty("isShuffled")
    private boolean isShuffled;

    public QueueDto() {
        playedTracks = List.of();
        waitingTracks = List.of();
        originals = new OriginalTrackList();
    }
}
