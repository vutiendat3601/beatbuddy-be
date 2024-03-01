package tech.datvu.beatbuddy.api.service;

import java.util.List;
import java.util.UUID;

import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.dto.TrackStreamDto;

public interface TrackService {

    TrackStreamDto getStream(UUID trackId);

    TrackDto getTrack(UUID trackId);

    List<TrackDto> getTracks(Iterable<UUID> trackIds);
}
