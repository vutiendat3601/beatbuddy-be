package tech.datvu.beatbuddy.api.service;

import java.util.UUID;

import org.springframework.scheduling.annotation.Async;

@Async("backgroundTask")
public interface TrackServiceAsync {
    void increasePopularity(UUID trackId);
}
