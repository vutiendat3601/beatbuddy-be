package tech.datvu.beatbuddy.api.repository;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tech.datvu.beatbuddy.api.entity.Artist;

@Repository
public interface ArtistRepository extends JpaRepository<Artist, UUID> {

    @Cacheable(cacheNames = "cache1", key = "#id")
    @Query("""
            SELECT a FROM Artist a WHERE id = :id AND a.isPublic = true
            """)
    Optional<Artist> findPublicById(@Param("id") UUID id);

    @Cacheable(cacheNames = "cache1", key = "#id")
    Optional<Artist> findById(UUID id);

    @Query("""
            SELECT a FROM Artist a WHERE id IN :ids AND a.isPublic = true
            """)
    List<Artist> findAllPublicById(@Param("ids") Iterable<UUID> ids);

    @Query("""
            SELECT a FROM Artist a WHERE cast(function('unaccent', a.name) AS text) ILIKE %:keyword%
            """)
    Page<Artist> findAllByKeyword(Pageable pageReq, @Param("keyword") String keyword);

    @Query("""
            SELECT a FROM Artist a
            WHERE a.id IN :ids AND a.isPublic = true
            AND (a.name ILIKE %:keyword% OR a.realName ILIKE %:keyword%)
            """)
    List<Artist> findAllPublicByKeywordAndId(String keyword, Iterable<UUID> ids);

    @Query("""
            SELECT a FROM Artist a WHERE a.id IN
            ( SELECT ta.artistId FROM TrackArtist ta WHERE ta.artistId = :trackId )
            """)
    List<Artist> findByTrackId(@Param("trackId") UUID trackId);
}
