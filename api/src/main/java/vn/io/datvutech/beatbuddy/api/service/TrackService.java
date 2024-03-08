package vn.io.datvutech.beatbuddy.api.service;

import java.util.Collection;
import java.util.List;
import java.util.UUID;

import vn.io.datvutech.beatbuddy.api.dto.ArtistDto;
import vn.io.datvutech.beatbuddy.api.dto.AudioDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackStreamDto;

public interface TrackService {

    TrackStreamDto getTrackStream(UUID trackId);

    TrackDto getTrack(UUID trackId);

    List<TrackDto> getTracks(Collection<UUID> trackIds);

    List<ArtistDto> getTrackArtists(UUID trackId);

    List<AudioDto> getTrackAudios(UUID trackId);

    void increaseSearchPriority(UUID trackId);
}
