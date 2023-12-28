package tech.datvu.beatbuddy.api.resource;

import java.util.Collection;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tech.datvu.beatbuddy.api.resource.models.Resource;
import tech.datvu.beatbuddy.api.resource.models.Resource.ResourceType;

public interface ResourceRepo extends JpaRepository<Resource, UUID> {

    @Query(" SELECT r FROM Resource r " +
            " WHERE (cast(function('unaccent', r.name) AS text) ILIKE %:keyword% " +
            " OR cast(function('unaccent', r.tags) AS text) ILIKE %:keyword%) " +
            " AND r.type IN :types")
    Page<Resource> findByTypeInAndKeyword(
            Pageable pageable,
            @Param("types") Collection<ResourceType> types,
            @Param("keyword") String keyword);
}
