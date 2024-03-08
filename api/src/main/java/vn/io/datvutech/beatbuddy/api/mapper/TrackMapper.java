package vn.io.datvutech.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import vn.io.datvutech.beatbuddy.api.dto.TrackDto;
import vn.io.datvutech.beatbuddy.api.entity.Track;

@Component
public class TrackMapper {
    public TrackDto mapToTrackDto(Track track) {
        return track == null
                ? null
                : TrackDto.builder()
                        .id(track.getId())
                        .refCode(track.getRefCode())
                        .name(track.getName())
                        .isPublic(track.isPublic())
                        .description(track.getDescription())
                        .durationSec(track.getDurationSec())
                        .thumbnail(track.getThumbnail())
                        .isPlayable(track.isPlayable())
                        .releasedDate(track.getReleasedDate())
                        .build();
    }
}
