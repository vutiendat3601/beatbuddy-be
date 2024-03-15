package vn.io.datvutech.beatbuddy.api.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.dto.ArtistDto;
import vn.io.datvutech.beatbuddy.api.dto.AudioDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackStreamDto;
import vn.io.datvutech.beatbuddy.api.entity.Audio.AudioQuality;
import vn.io.datvutech.beatbuddy.api.entity.AudioTrack;
import vn.io.datvutech.beatbuddy.api.entity.Track;
import vn.io.datvutech.beatbuddy.api.entity.TrackArtist;
import vn.io.datvutech.beatbuddy.api.exception.TrackException;
import vn.io.datvutech.beatbuddy.api.mapper.TrackMapper;
import vn.io.datvutech.beatbuddy.api.repository.AudioTrackRepository;
import vn.io.datvutech.beatbuddy.api.repository.TrackArtistRepository;
import vn.io.datvutech.beatbuddy.api.repository.TrackRepository;
import vn.io.datvutech.beatbuddy.api.service.ArtistService;
import vn.io.datvutech.beatbuddy.api.service.AudioService;
import vn.io.datvutech.beatbuddy.api.service.TrackService;
import vn.io.datvutech.beatbuddy.api.service.TrackServiceAsync;

@Service
@RequiredArgsConstructor
public class TrackServiceImpl implements TrackService {
    // ## Mappers
    private final TrackMapper trackMapper;

    // ## Services
    private final ArtistService artistService;
    private final AudioService audioService;
    private final TrackServiceAsync trackServiceAsync;

    // ## Repos
    private final AudioTrackRepository audioTrackRepo;
    private final TrackRepository trackRepo;
    private final TrackArtistRepository trackArtistRepo;

    @Override
    public TrackDto getTrack(UUID trackId) {
        TrackDto trackDto = null;
        if (trackId != null) {
            Track track = trackRepo.findById(trackId)
                    .orElseThrow(() -> TrackException.TRACK_NOT_FOUND.instance());
            trackDto = trackMapper.mapToTrackDto(track);
            List<ArtistDto> artistDtos = getTrackArtists(trackId);
            trackDto.setArtists(artistDtos);
        }
        return trackDto;
    }

    @Override
    public List<TrackDto> getTracks(Collection<UUID> trackIds) {
        trackIds = trackIds.stream().filter(tId -> tId != null).toList();
        List<Track> tracks = trackRepo.findAllById(trackIds);
        List<TrackDto> trackDtos = tracks.stream().map(
                t -> {
                    TrackDto trackDto = trackMapper.mapToTrackDto(t);
                    trackDto.setArtists(getTrackArtists(t.getId()));
                    return trackDto;
                }).toList();
        return trackDtos;
    }

    @Override
    public TrackStreamDto getTrackStream(UUID trackId) {
        Track track = trackRepo.findById(trackId)
                .orElseThrow(() -> TrackException.TRACK_NOT_FOUND.instance());

        TrackStreamDto trackStreamDto = new TrackStreamDto();
        if (track.isPlayable()) {
            List<AudioDto> audioDtos = getTrackAudios(trackId);
            final Map<AudioQuality, List<String>> links = trackStreamDto.getLinks();
            audioDtos.forEach(a -> {
                List<String> urls = links.get(a.getQuality());
                urls.add(a.getPath());
            });
        }
        return trackStreamDto;
    }

    @Override
    public List<ArtistDto> getTrackArtists(UUID trackId) {
        List<TrackArtist> trackArtists = trackArtistRepo.findAllByTrackId(trackId);
        return trackArtists.stream()
                .map(ta -> artistService.getArtist(ta.getArtistId())).toList();
    }

    @Override
    public List<AudioDto> getTrackAudios(UUID trackId) {
        trackRepo.findById(trackId)
                .orElseThrow(() -> TrackException.TRACK_NOT_FOUND.instance());
        List<AudioTrack> audioTracks = audioTrackRepo.findAllByTrackId(trackId);
        return audioTracks.stream()
                .map(at -> audioService.getAudio(at.getAudioId())).toList();
    }

    @Override
    public void increaseSearchPriority(UUID trackId) {
        trackServiceAsync.increasePopularity(trackId);
    }
}
