package tech.datvu.beatbuddy.api.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.datvu.beatbuddy.api.entity.AudioTrack;

public interface AudioTrackRepository extends JpaRepository<AudioTrack, Long> {
    List<AudioTrack> findAllByTrackId(UUID trackId);
}
