package tech.datvu.beatbuddy.api.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tech.datvu.beatbuddy.api.entity.TrackArtist;

public interface TrackArtistsitory extends JpaRepository<TrackArtist, Long> {
    List<TrackArtist> findAllByTrackId(UUID trackId);

    @Query(" SELECT ta FROM TrackArtist ta WHERE ta.trackId IN :trackIds ")
    List<TrackArtist> findAllByTrackId(@Param("trackIds") Iterable<UUID> trackIds);
}
