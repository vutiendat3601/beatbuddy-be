package vn.io.datvutech.beatbuddy.api.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.io.datvutech.beatbuddy.api.entity.TrackArtist;

public interface TrackArtistRepository extends JpaRepository<TrackArtist, Long> {
    List<TrackArtist> findAllByTrackId(UUID trackId);

    List<TrackArtist> findAllByTrackIdIn(Iterable<UUID> trackIds);

    List<TrackArtist> findAllByArtistId(UUID artistId);
}
