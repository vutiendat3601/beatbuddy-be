package tech.datvu.beatbuddy.api.track;

import java.time.LocalDate;
import java.util.Optional;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tech.datvu.beatbuddy.api.track.models.TrackSuggestion;

public interface TrackSuggestionRepo extends JpaRepository<TrackSuggestion, UUID> {
    // @Cacheable(cacheNames = "cache1", key = "{#pageable,#createdBy}")
    // Page<TrackSuggestion> findAllByCreatedBy(Pageable pageable, String
    // createdBy);
    @Query(" SELECT ts FROM TrackSuggestion ts " +
            " WHERE (cast(function('unaccent', ts.title) AS text) ILIKE %:keyword% " +
            " OR cast(function('unaccent', ts.description) AS text) ILIKE %:keyword% " +
            " OR cast(function('unaccent', ts.releasedDate) AS text) ILIKE %:keyword% " +
            " OR cast(function('unaccent', ts.tags) AS text) ILIKE %:keyword%) " +
            " AND (ts.createdAt BETWEEN cast(:fromDate AS date) AND cast(:toDate AS date)) ")
    Page<TrackSuggestion> findAll(
            Pageable pageable,
            @Param("keyword") String keyword,
            @Param("fromDate") LocalDate fromDate,
            @Param("toDate") LocalDate toDate);

    @Query(" SELECT ts FROM TrackSuggestion ts " +
            " WHERE (cast(function('unaccent', ts.title) AS text) ILIKE %:keyword% " +
            " OR cast(function('unaccent', ts.description) AS text) ILIKE %:keyword% " +
            " OR cast(function('unaccent', ts.releasedDate) AS text) ILIKE %:keyword% " +
            " OR cast(function('unaccent', ts.tags) AS text) ILIKE %:keyword%) " +
            " AND (ts.createdAt BETWEEN cast(:fromDate AS date) AND cast(:toDate AS date) " +
            " AND ts.createdBy = :createdBy) ")
    Page<TrackSuggestion> findByKeywordAndArtistIdAndCreatedAtAndCreatedBy(
            Pageable pageable,
            @Param("keyword") String keyword,
            @Param("fromDate") LocalDate fromDate,
            @Param("toDate") LocalDate toDate,
            @Param("createdBy") String createdBy);

    Optional<TrackSuggestion> findFirstByTempAudioCodeAndCreatedBy(String tempAudioCode, String createdBy);

    Optional<TrackSuggestion> findFirstByUrlAndCreatedBy(String url, String createdBy);
}
