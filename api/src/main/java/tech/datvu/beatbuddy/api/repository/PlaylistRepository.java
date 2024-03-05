package tech.datvu.beatbuddy.api.repository;

import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tech.datvu.beatbuddy.api.entity.Playlist;

public interface PlaylistRepository extends JpaRepository<Playlist, UUID> {
    Optional<Playlist> findByIdAndCreatedBy(UUID id, String createdBy);

    Optional<Playlist> findByIdAndIsPublicTrue(UUID id);

    @Query("""
            SELECT p FROM Playlist p
            WHERE ( (cast(function('unaccent', p.name) AS text) ILIKE %:keyword%
            OR cast(function('unaccent', p.description) AS text) ILIKE %:keyword%)
            AND ( p.createdAt BETWEEN cast(:fromDate AS date) AND cast(:toDate AS date)
            AND p.createdBy = :createdBy ))
            """)
    Page<Playlist> findByKeywordAndCreatedAtRangeAndCreatedBy(
            Pageable pageable,
            @Param("keyword") String keyword,
            @Param("fromDate") LocalDate fromDate,
            @Param("toDate") LocalDate toDate,
            @Param("createdBy") String createdBy

    );
}
