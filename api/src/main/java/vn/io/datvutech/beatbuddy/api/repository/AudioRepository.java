package vn.io.datvutech.beatbuddy.api.repository;

import java.util.Optional;
import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.io.datvutech.beatbuddy.api.entity.Audio;

public interface AudioRepository extends JpaRepository<Audio, UUID> {
    Optional<Audio> findByRefCode(String code);
}
