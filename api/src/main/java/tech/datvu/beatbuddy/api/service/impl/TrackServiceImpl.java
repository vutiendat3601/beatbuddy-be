package tech.datvu.beatbuddy.api.service.impl;

import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.dto.ArtistDto;
import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.dto.TrackStreamDto;
import tech.datvu.beatbuddy.api.entity.Artist;
import tech.datvu.beatbuddy.api.entity.Audio;
import tech.datvu.beatbuddy.api.entity.Audio.AudioQuality;
import tech.datvu.beatbuddy.api.entity.AudioTrack;
import tech.datvu.beatbuddy.api.entity.Search;
import tech.datvu.beatbuddy.api.entity.Search.ResourceType;
import tech.datvu.beatbuddy.api.entity.Track;
import tech.datvu.beatbuddy.api.entity.TrackArtist;
import tech.datvu.beatbuddy.api.exception.TrackException;
import tech.datvu.beatbuddy.api.mapper.ArtistMapper;
import tech.datvu.beatbuddy.api.mapper.TrackMapper;
import tech.datvu.beatbuddy.api.repository.ArtistRepository;
import tech.datvu.beatbuddy.api.repository.AudioRepository;
import tech.datvu.beatbuddy.api.repository.AudioTrackRepository;
import tech.datvu.beatbuddy.api.repository.TrackArtistsitory;
import tech.datvu.beatbuddy.api.repository.TrackRepository;
import tech.datvu.beatbuddy.api.service.SearchServiceAsync;
import tech.datvu.beatbuddy.api.service.TrackService;
import tech.datvu.beatbuddy.api.util.TextUtil;

@Service
@RequiredArgsConstructor
public class TrackServiceImpl implements TrackService {
    // ## Mappers
    private final TrackMapper trackMapper;
    private final ArtistMapper artistMapper;

    // ## Services
    private final SearchServiceAsync searchServiceaAsync;

    // ## Repos
    private final AudioRepository audioRepo;
    private final AudioTrackRepository audioTrackRepo;
    private final TrackRepository trackRepo;
    private final ArtistRepository artistRepo;
    private final TrackArtistsitory trackArtistRepo;

    @Override
    public TrackDto getTrack(UUID trackId) {
        Track track = trackRepo.findById(trackId)
                .orElseThrow(() -> TrackException.TRACK_NOT_FOUND.instance());
        TrackDto trackDto = trackMapper.mapToTrackDto(track);
        searchServiceaAsync.increasePriorityByUri(List.of(Search.mapUri(ResourceType.TRACK, trackDto.getId())));

        List<TrackArtist> trackArtists = trackArtistRepo.findAllByTrackId(trackId);
        List<UUID> artistIds = trackArtists.stream().map(ta -> ta.getArtistId()).toList();
        List<Artist> artists = artistRepo.findAllById(artistIds);
        searchServiceaAsync
                .increasePriorityByUri(artistIds.stream()
                        .map(aid -> Search.mapUri(ResourceType.ARTIST, aid)).toList());
        List<ArtistDto> artistDtos = artists.stream().map(artistMapper::mapToArtistDto).toList();
        trackDto.setArtists(artistDtos);
        return trackDto;
    }

    @Override
    public List<TrackDto> getTracks(Iterable<UUID> trackIds) {
        List<Track> tracks = trackRepo.findAllById(trackIds);
        final List<TrackArtist> trackArtists = trackArtistRepo
                .findAllByTrackId(tracks.stream().map(t -> t.getId()).toList());
        List<Artist> artists = artistRepo
                .findAllById(trackArtists.stream()
                        .map(ta -> ta.getArtistId())
                        .collect(Collectors.toSet()));
        List<ArtistDto> artistDtos = artists.stream()
                .map(artistMapper::mapToArtistDto).toList();
        Map<UUID, ArtistDto> artistDtosMap = artistDtos.stream()
                .collect(Collectors.toMap(ArtistDto::getId, a -> a));
        List<TrackDto> trackDtos = tracks.stream().map(
                t -> {
                    TrackDto trackDto = trackMapper.mapToTrackDto(t);
                    List<ArtistDto> aDtos = trackArtists.stream()
                            .filter(ta -> ta.getTrackId().equals(t.getId()))
                            .map(ta -> artistDtosMap.get(ta.getArtistId())).toList();
                    trackDto.setArtists(aDtos);
                    return trackDto;
                }).toList();
        return trackDtos;
    }

    @Override
    public TrackStreamDto getStream(UUID trackId) {
        Track track = trackRepo.findById(trackId)
                .orElseThrow(() -> TrackException.TRACK_NOT_FOUND.instance());

        TrackStreamDto trackStreamDto = new TrackStreamDto();
        if (track.isPlayable()) {
            String refCode = track.getRefCode();
            String fileName = TextUtil.hashMd5(refCode == null ? track.getId() + "" : refCode);
            trackStreamDto.setFileName(fileName);
            List<AudioTrack> audioTracks = audioTrackRepo.findAllByTrackId(trackId);
            List<Audio> audios = audioRepo
                    .findAllById(audioTracks.stream().map(at -> at.getAudioId()).toList());
            final Map<AudioQuality, List<String>> links = trackStreamDto.getLinks();
            audios.forEach(a -> {
                List<String> urls = links.get(a.getQuality());
                urls.add(a.getPath());
            });
            searchServiceaAsync
                    .increasePriorityByUri(
                            List.of(Search.mapUri(ResourceType.TRACK, track.getId())));
        }
        return trackStreamDto;
    }
}
