package tech.datvu.beatbuddy.api.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.datvu.beatbuddy.api.entity.Audio;

public interface AudioRepository extends JpaRepository<Audio, UUID> {
    Optional<Audio> findByRefCode(String code);
}
