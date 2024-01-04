package tech.datvu.beatbuddy.api.search;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tech.datvu.beatbuddy.api.search.models.Search;
import tech.datvu.beatbuddy.api.search.models.Search.ResourceType;

public interface SearchRepo extends JpaRepository<Search, UUID> {
    @Query(" SELECT s FROM Search s " +
            " WHERE ( cast(function('unaccent', s.name) AS text) ILIKE %:keyword% " +
            " OR cast(function('unaccent', s.tags) AS text) ILIKE %:keyword% ) " +
            " AND s.type = :type " +
            " ORDER BY CASE WHEN cast(function('unaccent', s.name) AS text) ILIKE %:keyword% " +
            " THEN 0 ELSE 1 END, priority DESC ")
    Page<Search> findByTypeAndKeyword(
            Pageable pageable,
            @Param("keyword") String keyword,
            @Param("type") ResourceType type);

    @Query(" SELECT s FROM Search s WHERE s.uri IN :searchUris")
    List<Search> findAllByUri(@Param("searchUris") Iterable<String> searchUris);
}
