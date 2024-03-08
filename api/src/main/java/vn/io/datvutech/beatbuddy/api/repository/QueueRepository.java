package vn.io.datvutech.beatbuddy.api.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;

import vn.io.datvutech.beatbuddy.api.entity.Queue;

public interface QueueRepository extends JpaRepository<Queue, UUID> {
}
