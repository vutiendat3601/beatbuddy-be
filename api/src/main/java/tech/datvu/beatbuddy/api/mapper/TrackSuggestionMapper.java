package tech.datvu.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import tech.datvu.beatbuddy.api.dto.TrackSuggestionDto;
import tech.datvu.beatbuddy.api.dto.TrackingDto;
import tech.datvu.beatbuddy.api.entity.TrackSuggestion;
import tech.datvu.beatbuddy.api.entity.TrackSuggestion.Status;
import tech.datvu.beatbuddy.api.model.request.TrackSuggestionRequest;

@Component
public class TrackSuggestionMapper {

    public TrackSuggestion mapToTrackSuggestion(TrackSuggestionRequest trackSuggReq) {
        return trackSuggReq == null
                ? null
                : TrackSuggestion.builder()
                        .name(trackSuggReq.getName())
                        .url(trackSuggReq.getUrl())
                        .releasedDate(trackSuggReq.getReleasedDate())
                        .description(trackSuggReq.getDescription())
                        .lyrics(trackSuggReq.getLyrics())
                        .status(Status.PENDING)
                        .build();
    }

    public TrackSuggestionDto mapToTrackSuggestionDto(TrackSuggestion trackSugg) {
        TrackSuggestionDto trackSuggDto = trackSugg == null
                ? null
                : TrackSuggestionDto.builder()
                        .id(trackSugg.getId())
                        .name(trackSugg.getName())
                        .url(trackSugg.getUrl())
                        .releasedDate(trackSugg.getReleasedDate())
                        .description(trackSugg.getDescription())
                        .audioRefCode(trackSugg.getAudioRefCode())
                        .trackId(trackSugg.getTrackId())
                        .status(trackSugg.getStatus())
                        .build();
        TrackingDto.map(trackSuggDto, trackSugg);
        return trackSuggDto;
    }
}
