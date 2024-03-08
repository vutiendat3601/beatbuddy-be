package vn.io.datvutech.beatbuddy.api.service;

import java.util.UUID;

import org.springframework.data.domain.Page;

import vn.io.datvutech.beatbuddy.api.dto.TrackSuggestionDto;
import vn.io.datvutech.beatbuddy.api.model.request.TrackSuggestionQueryRequest;
import vn.io.datvutech.beatbuddy.api.model.request.TrackSuggestionRequest;

public interface TrackSuggestionService {
    
    UUID createTrackSuggestion(TrackSuggestionRequest suggTrackReq);

    Page<TrackSuggestionDto> getTrackSuggestions(TrackSuggestionQueryRequest pageReq);

    Page<TrackSuggestionDto> getUserTrackSuggestions(TrackSuggestionQueryRequest pageReq);
}
