package tech.datvu.beatbuddy.api.track;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.datvu.beatbuddy.api.track.models.Track;

public interface TrackRepo extends JpaRepository<Track, UUID> {
}
