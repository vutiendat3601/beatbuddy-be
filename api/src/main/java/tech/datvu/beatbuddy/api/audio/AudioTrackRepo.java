package tech.datvu.beatbuddy.api.audio;

import java.util.List;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.datvu.beatbuddy.api.audio.models.AudioTrack;

public interface AudioTrackRepo extends JpaRepository<AudioTrack, Long> {
    List<AudioTrack> findAllByTrackId(UUID trackId);
}
