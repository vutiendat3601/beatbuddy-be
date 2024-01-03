package tech.datvu.beatbuddy.api.track;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.datvu.beatbuddy.api.track.models.TrackArtist;

public interface TrackArtistRepo extends JpaRepository<TrackArtist, Long> {
    List<TrackArtist> findAllByTrackId(UUID trackId);
}
