package tech.datvu.beatbuddy.api.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tech.datvu.beatbuddy.api.entity.Search;
import tech.datvu.beatbuddy.api.entity.Search.ResourceType;

public interface SearchRepository extends JpaRepository<Search, UUID> {
    @Query("""
            SELECT s FROM Search s
            WHERE ( cast(unaccent(s.name) AS text) ILIKE %:keyword%
            OR cast(unaccent(s.tags) AS text) ILIKE %:keyword% )
            AND s.type = :type
            ORDER BY CASE WHEN cast(unaccent(s.name) AS text) ILIKE :keyword%
            THEN 0 ELSE 1 END, popularity DESC
            """)
    Page<Search> findByTypeAndKeyword(
            @Param("type") ResourceType type,
            @Param("keyword") String keyword,
            Pageable pageable);

    @Query("""
            SELECT s FROM Search s WHERE s.uri IN :searchUris
            """)
    List<Search> findAllByUri(@Param("searchUris") Iterable<String> searchUris);
}
