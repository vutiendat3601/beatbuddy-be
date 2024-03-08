package vn.io.datvutech.beatbuddy.api.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.io.datvutech.beatbuddy.api.entity.AudioTrack;

public interface AudioTrackRepository extends JpaRepository<AudioTrack, Long> {
    List<AudioTrack> findAllByTrackId(UUID trackId);
}
