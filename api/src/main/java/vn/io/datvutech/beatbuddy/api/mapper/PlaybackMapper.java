package vn.io.datvutech.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import vn.io.datvutech.beatbuddy.api.dto.PlaybackDto;
import vn.io.datvutech.beatbuddy.api.entity.Playback;

@Component
public class PlaybackMapper {
    public PlaybackDto mapToPlaybackDto(Playback playback) {

        return PlaybackDto.builder()
                .id(playback.getId())
                .queueId(playback.getQueueId())
                .playbackStateId(playback.getPlaybackStateId())
                .ownerId(playback.getOwnerId())
                .build();
    }
}
