package vn.io.datvutech.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import vn.io.datvutech.beatbuddy.api.dto.PlaylistDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackingDto;
import vn.io.datvutech.beatbuddy.api.entity.Playlist;
import vn.io.datvutech.beatbuddy.api.model.request.PlaylistRequest;

@Component
public class PlaylistMapper {
    public PlaylistDto mapToPlaylistDto(Playlist playlist) {
        PlaylistDto playlistDto = playlist == null
                ? null
                : PlaylistDto.builder()
                        .id(playlist.getId())
                        .name(playlist.getName())
                        .isPublic(playlist.isPublic())
                        .description(playlist.getDescription())
                        .durationSec(playlist.getDurationSec())
                        .build();
        TrackingDto.map(playlistDto, playlist);
        return playlistDto;
    }

    public Playlist mapToPlaylist(PlaylistRequest playlistReq) {
        return playlistReq == null
                ? null
                : Playlist.builder()
                        .name(playlistReq.getName())
                        .description(playlistReq.getDescription())
                        .isPublic(playlistReq.getIsPublic())
                        .build();
    }
}
