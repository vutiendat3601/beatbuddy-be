package tech.datvu.beatbuddy.api.service;

import java.util.UUID;

import org.springframework.data.domain.Page;

import tech.datvu.beatbuddy.api.dto.TrackSuggestionDto;
import tech.datvu.beatbuddy.api.model.request.TrackSuggestionQueryRequest;
import tech.datvu.beatbuddy.api.model.request.TrackSuggestionRequest;

public interface TrackSuggestionService {
    
    UUID createTrackSuggestion(TrackSuggestionRequest suggTrackReq);

    Page<TrackSuggestionDto> getTrackSuggestions(TrackSuggestionQueryRequest pageReq);

    Page<TrackSuggestionDto> getUserTrackSuggestions(TrackSuggestionQueryRequest pageReq);
}
