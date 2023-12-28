package tech.datvu.beatbuddy.api.track.models;

import org.springframework.stereotype.Component;

import tech.datvu.beatbuddy.api.track.models.TrackSuggestion.Status;

@Component
public class TrackMapper {
    public TrackSuggestion mapToTrackSuggestion(TrackSuggestionRequest suggTrackReq) {
        return TrackSuggestion.builder()
                .title(suggTrackReq.getTitle())
                .url(suggTrackReq.getUrl())
                .releasedDate(suggTrackReq.getReleasedDate())
                .description(suggTrackReq.getDescription())
                .lyrics(suggTrackReq.getLyrics())
                .status(Status.PENDING)
                .build();
    }

    public TrackSuggestionDto mapToTrackSuggestionDto(TrackSuggestion suggTrack) {
        return TrackSuggestionDto.builder()
                .id(suggTrack.getId())
                .title(suggTrack.getTitle())
                .url(suggTrack.getUrl())
                .releasedDate(suggTrack.getReleasedDate())
                .description(suggTrack.getDescription())
                .tempAudioCode(suggTrack.getTempAudioCode())
                .audioCode(suggTrack.getAudioCode())
                .createdAt(suggTrack.getCreatedAt())
                .updatedAt(suggTrack.getUpdatedAt())
                .createdBy(suggTrack.getCreatedBy())
                .status(suggTrack.getStatus())
                .build();
    }
}
