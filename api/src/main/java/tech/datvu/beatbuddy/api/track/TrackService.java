package tech.datvu.beatbuddy.api.track;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;

import tech.datvu.beatbuddy.api.track.models.TrackDto;
import tech.datvu.beatbuddy.api.track.models.TrackStreamDto;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestionDto;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestionQueryRequest;
import tech.datvu.beatbuddy.api.track.models.TrackSuggestionRequest;

public interface TrackService {
    UUID createTrackSuggestion(TrackSuggestionRequest suggTrackReq);

    Page<TrackSuggestionDto> getTrackSuggestions(TrackSuggestionQueryRequest pageReq);

    Page<TrackSuggestionDto> getUserTrackSuggestions(TrackSuggestionQueryRequest pageReq);

    TrackStreamDto getStream(UUID trackId);

    TrackDto getTrack(UUID trackId);

    List<TrackDto> getTracks(Iterable<UUID> trackIds);
}
