package tech.datvu.beatbuddy.api.audio;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.datvu.beatbuddy.api.audio.models.Audio;

public interface AudioRepo extends JpaRepository<Audio, UUID> {
    Optional<Audio> findByRefCode(String code);
}
