package vn.io.datvutech.beatbuddy.api.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.io.datvutech.beatbuddy.api.entity.PlaylistTrack;

public interface PlaylistTrackRepository extends JpaRepository<PlaylistTrack, Long> {
    Optional<PlaylistTrack> findByPlaylistIdAndTrackId(UUID playlistId, UUID trackId);
    List<PlaylistTrack> findAllByPlaylistId(UUID playlistId);
}
