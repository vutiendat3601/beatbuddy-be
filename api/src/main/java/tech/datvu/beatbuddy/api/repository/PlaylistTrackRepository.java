package tech.datvu.beatbuddy.api.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.datvu.beatbuddy.api.entity.PlaylistTrack;

public interface PlaylistTrackRepository extends JpaRepository<PlaylistTrack, Long> {
    Optional<PlaylistTrack> findByPlaylistIdAndTrackId(UUID playlistId, UUID trackId);
    List<PlaylistTrack> findAllByPlaylistId(UUID playlistId);
}
