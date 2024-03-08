package vn.io.datvutech.beatbuddy.api.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.io.datvutech.beatbuddy.api.entity.Playback;

public interface PlaybackRepository extends JpaRepository<Playback, UUID> {
    Optional<Playback> findByOwnerId(UUID ownerId);
}
