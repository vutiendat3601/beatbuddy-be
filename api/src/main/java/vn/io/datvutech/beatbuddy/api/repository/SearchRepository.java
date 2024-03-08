package vn.io.datvutech.beatbuddy.api.repository;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import vn.io.datvutech.beatbuddy.api.entity.Search;
import vn.io.datvutech.beatbuddy.api.model.ResourceType;

public interface SearchRepository extends JpaRepository<Search, UUID> {
    @Query("""
            SELECT s FROM Search s
            WHERE ( cast(unaccent(s.name) AS text) ILIKE %:keyword%
            OR cast(unaccent(s.tags) AS text) ILIKE %:keyword% )
            AND s.type = :type
            ORDER BY CASE WHEN cast(unaccent(s.name) AS text) ILIKE :keyword%
            THEN 0 ELSE 1 END, popularity DESC
            """

    )
    Page<Search> findByTypeAndKeyword(
            @Param("type") ResourceType type,
            @Param("keyword") String keyword,
            Pageable pageable);

    List<Search> findAllByUriIn(Iterable<String> searchUris);

    List<Search> findAllByUriInAndType(Pageable pageable, Iterable<String> uris, ResourceType type);

    Page<Search> findAllByType(Pageable pageable, ResourceType type);
}
