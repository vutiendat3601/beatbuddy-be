package tech.datvu.beatbuddy.api.artist;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tech.datvu.beatbuddy.api.artist.models.Artist;

@Repository
public interface ArtistRepo extends JpaRepository<Artist, UUID> {

    @Cacheable(cacheNames = "cache1", key = "#id")
    @Query(" SELECT a FROM Artist a WHERE id = :id AND a.isPublic = true")
    Optional<Artist> findPublicById(@Param("id") UUID id);

    @Cacheable(cacheNames = "cache1", key = "#id")
    Optional<Artist> findById(UUID id);

    @Query(" SELECT a FROM Artist a WHERE id IN :ids AND a.isPublic = true")
    List<Artist> findPublicById(@Param("ids") Iterable<UUID> ids);

    @Query(" SELECT a FROM Artist a " +
            " WHERE a.id IN :ids AND a.isPublic = true " +
            " AND (a.name ILIKE %:keyword% OR a.realName ILIKE %:keyword%) ")
    List<Artist> findPublicByKeywordAndId(String keyword, Iterable<UUID> ids);
}
