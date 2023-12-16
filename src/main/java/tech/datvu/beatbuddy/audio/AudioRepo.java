package tech.datvu.beatbuddy.audio;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.datvu.beatbuddy.audio.models.Audio;

public interface AudioRepo extends JpaRepository<Audio, Long> {
    Optional<Audio> findByCode(String code);
}
