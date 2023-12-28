package tech.datvu.beatbuddy.api.track;

import java.util.Collection;
import java.util.List;
import java.util.UUID;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.jpa.repository.JpaRepository;

import tech.datvu.beatbuddy.api.track.models.TrackSuggestionArtist;

public interface TrackSuggestionArtistRepo extends JpaRepository<TrackSuggestionArtist, Long> {
    @Cacheable(cacheNames = "cache1", key = "{'suggTrackArtist',#suggTrackId}")
    List<TrackSuggestionArtist> findAllByTrackSuggestionId(UUID trackSuggId);

    List<TrackSuggestionArtist> findAllByTrackSuggestionIdIn(Collection<UUID> trackSuggIds);
}
