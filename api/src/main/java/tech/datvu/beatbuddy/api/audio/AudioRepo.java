package tech.datvu.beatbuddy.api.audio;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.datvu.beatbuddy.api.audio.models.Audio;

public interface AudioRepo extends JpaRepository<Audio, Long> {
    Optional<Audio> findByCode(String code);
}
