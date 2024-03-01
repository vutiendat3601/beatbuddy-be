package tech.datvu.beatbuddy.api.service;

import org.springframework.scheduling.annotation.Async;

import tech.datvu.beatbuddy.api.entity.Playlist;

@Async("backgroundTask")
public interface PlaylistServiceAsync {
    void createPlaylist(Playlist playlist);
}
