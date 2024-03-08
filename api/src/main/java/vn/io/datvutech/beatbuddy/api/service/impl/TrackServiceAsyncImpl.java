package vn.io.datvutech.beatbuddy.api.service.impl;

import static vn.io.datvutech.beatbuddy.api.model.ResourceType.ARTIST;
import static vn.io.datvutech.beatbuddy.api.model.ResourceType.TRACK;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.entity.TrackArtist;
import vn.io.datvutech.beatbuddy.api.model.ResourceType;
import vn.io.datvutech.beatbuddy.api.repository.TrackArtistRepository;
import vn.io.datvutech.beatbuddy.api.repository.TrackRepository;
import vn.io.datvutech.beatbuddy.api.service.SearchServiceAsync;
import vn.io.datvutech.beatbuddy.api.service.TrackServiceAsync;

@RequiredArgsConstructor
@Service
public class TrackServiceAsyncImpl implements TrackServiceAsync {
    private final TrackRepository trackRepo;
    private final SearchServiceAsync searchServiceAsync;
    private final TrackArtistRepository trackArtistRepo;

    @Override
    public void increasePopularity(UUID trackId) {
        trackRepo.findById(trackId)
                .ifPresent((track) -> {
                    final Set<String> uris = new HashSet<>();
                    uris.add(ResourceType.mapUri(TRACK, trackId));
                    List<TrackArtist> trackArtists = trackArtistRepo.findAllByTrackId(trackId);
                    trackArtists.forEach(ta -> uris.add(ResourceType.mapUri(ARTIST, ta.getArtistId())));
                    searchServiceAsync.increasePopularity(uris);
                });
    }

}
