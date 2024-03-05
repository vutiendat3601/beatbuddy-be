package tech.datvu.beatbuddy.api.repository;

import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tech.datvu.beatbuddy.api.entity.Track;

public interface TrackRepository extends JpaRepository<Track, UUID> {
    @Query("""
            SELECT t FROM Track t WHERE t.id IN
            ( SELECT ta.trackId FROM TrackArtist ta WHERE ta.artistId = :artistId )
            """)
    Page<Track> findByArtistId(Pageable pageReq, @Param("artistId") UUID artistId);
}
