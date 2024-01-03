package tech.datvu.beatbuddy.api.track.models;

import org.springframework.stereotype.Component;

import tech.datvu.beatbuddy.api.track.models.TrackSuggestion.Status;

@Component
public class TrackMapper {
    public TrackDto mapToTrackDto(Track track) {
        return TrackDto.builder()
                .id(track.getId())
                .refCode(track.getRefCode())
                .name(track.getName())
                .isPublic(track.isPublic())
                .description(track.getDescription())
                .durationSec(track.getDurationSec())
                .thumbnail(track.getThumbnail())
                .isPlayable(track.isPlayable())
                .build();
    }

    public TrackSuggestion mapToTrackSuggestion(TrackSuggestionRequest trackSuggReq) {
        return TrackSuggestion.builder()
                .name(trackSuggReq.getName())
                .url(trackSuggReq.getUrl())
                .releasedDate(trackSuggReq.getReleasedDate())
                .description(trackSuggReq.getDescription())
                .lyrics(trackSuggReq.getLyrics())
                .status(Status.PENDING)
                .build();
    }

    public TrackSuggestionDto mapToTrackSuggestionDto(TrackSuggestion trackSugg) {
        return TrackSuggestionDto.builder()
                .id(trackSugg.getId())
                .name(trackSugg.getName())
                .url(trackSugg.getUrl())
                .releasedDate(trackSugg.getReleasedDate())
                .description(trackSugg.getDescription())
                .audioRefCode(trackSugg.getAudioRefCode())
                .trackId(trackSugg.getTrackId())
                .createdAt(trackSugg.getCreatedAt())
                .updatedAt(trackSugg.getUpdatedAt())
                .createdBy(trackSugg.getCreatedBy())
                .status(trackSugg.getStatus())
                .build();
    }
}
