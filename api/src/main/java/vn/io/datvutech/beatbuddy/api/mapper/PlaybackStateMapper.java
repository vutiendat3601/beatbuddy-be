package vn.io.datvutech.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import vn.io.datvutech.beatbuddy.api.dto.PlaybackStateDto;
import vn.io.datvutech.beatbuddy.api.entity.PlaybackState;

@Component
public class PlaybackStateMapper {
    public PlaybackStateDto mapToPlaybackStateDto(PlaybackState playbackState) {
        return PlaybackStateDto.builder()
                .currentSec(playbackState.getCurrentSec())
                .trackId(playbackState.getTrackId())
                .volume(playbackState.getVolume())
                .currentSec(playbackState.getCurrentSec())
                .build();
    }
}
