package vn.io.datvutech.beatbuddy.api.service;

import org.springframework.scheduling.annotation.Async;

import vn.io.datvutech.beatbuddy.api.entity.Playlist;

@Async("backgroundTask")
public interface PlaylistServiceAsync {
    void createPlaylist(Playlist playlist);
}
