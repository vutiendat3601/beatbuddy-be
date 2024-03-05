package tech.datvu.beatbuddy.api.service;

import java.util.List;
import java.util.UUID;

import tech.datvu.beatbuddy.api.dto.ArtistDto;
import tech.datvu.beatbuddy.api.dto.AudioDto;
import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.dto.TrackStreamDto;

public interface TrackService {

    TrackStreamDto getTrackStream(UUID trackId);

    TrackDto getTrack(UUID trackId);

    List<TrackDto> getTracks(Iterable<UUID> trackIds);

    List<ArtistDto> getTrackArtists(UUID trackId);

    List<AudioDto> getTrackAudios(UUID trackId);

    void increaseSearchPriority(UUID trackId);
}
