package vn.io.datvutech.beatbuddy.api.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.io.datvutech.beatbuddy.api.entity.PlaybackState;

public interface PlaybackStateRepository extends JpaRepository<PlaybackState, UUID> {
}
