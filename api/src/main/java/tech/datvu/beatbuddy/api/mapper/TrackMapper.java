package tech.datvu.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.entity.Track;

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
