package vn.io.datvutech.beatbuddy.api.service.impl;

import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.dto.PlaybackDto;
import vn.io.datvutech.beatbuddy.api.dto.PlaybackStateDto;
import vn.io.datvutech.beatbuddy.api.dto.QueueDto;
import vn.io.datvutech.beatbuddy.api.dto.QueueDto.OriginalTrackList;
import vn.io.datvutech.beatbuddy.api.dto.TrackDto;
import vn.io.datvutech.beatbuddy.api.entity.Playback;
import vn.io.datvutech.beatbuddy.api.entity.PlaybackState;
import vn.io.datvutech.beatbuddy.api.entity.Queue;
import vn.io.datvutech.beatbuddy.api.exception.PlaybackException;
import vn.io.datvutech.beatbuddy.api.mapper.PlaybackMapper;
import vn.io.datvutech.beatbuddy.api.mapper.PlaybackStateMapper;
import vn.io.datvutech.beatbuddy.api.mapper.QueueMapper;
import vn.io.datvutech.beatbuddy.api.model.request.PlaybackRequest;
import vn.io.datvutech.beatbuddy.api.repository.PlaybackRepository;
import vn.io.datvutech.beatbuddy.api.repository.PlaybackStateRepository;
import vn.io.datvutech.beatbuddy.api.repository.QueueRepository;
import vn.io.datvutech.beatbuddy.api.service.PlaybackService;
import vn.io.datvutech.beatbuddy.api.service.TrackService;
import vn.io.datvutech.beatbuddy.api.util.UserContext;

@RequiredArgsConstructor
@Service
public class PlaybackServiceImpl implements PlaybackService {
    private final PlaybackStateMapper playbackStateMapper;
    private final QueueMapper queueMapper;
    private final PlaybackMapper playbackMapper;

    private final PlaybackRepository playbackRepo;
    private final PlaybackStateRepository playbackStateRepo;
    private final QueueRepository queueRepo;
    private final TrackService trackService;

    @Override
    public PlaybackDto getUserPlayback() {
        UUID userId = UUID.fromString(UserContext.getUserId());
        Playback playback = getPlayback(userId);
        PlaybackState playbackState = playbackStateRepo.findById(playback.getPlaybackStateId())
                .orElse(new PlaybackState());

        Queue queue = queueRepo.findById(playback.getQueueId())
                .orElse(new Queue());

        PlaybackStateDto playbackStateDto = playbackStateMapper.mapToPlaybackStateDto(playbackState);
        QueueDto queueDto = queueMapper.mapToQueueDto(queue);

        PlaybackDto playbackDto = playbackMapper.mapToPlaybackDto(playback);
        playbackDto.setPlaybackState(playbackStateDto);
        playbackDto.setQueue(queueDto);

        List<TrackDto> playedTracks = trackService.getTracks(queue.getPlayedTrackIds());
        List<TrackDto> waitingTracks = trackService.getTracks(queue.getWaitingTrackIds());
        List<TrackDto> originalPlayedTracks = trackService.getTracks(queue.getOriginalPlayedTrackIds());
        List<TrackDto> originalWaitingTracks = trackService.getTracks(queue.getOriginalWaitingTrackIds());
        queueDto.setPlayedTracks(playedTracks);
        queueDto.setWaitingTracks(waitingTracks);
        queueDto.setOriginals(new OriginalTrackList(originalPlayedTracks, originalWaitingTracks));
        TrackDto trackDto = trackService.getTrack(playbackState.getTrackId());
        playbackStateDto.setTrack(trackDto);
        return playbackDto;
    }

    @Override
    public void updateUserPlayback(PlaybackRequest playbackReq) {
        if (!validateTrackLists(playbackReq.getPlayedTrackIds(), playbackReq.getOriginalPlayedTrackIds())) {
            throw PlaybackException.NOT_MATCH_TRACK_LIST
                    .message("playedTrackIds and originalPlayedTrackIds doesn't match").instance();
        }
        if (!validateTrackLists(playbackReq.getWaitingTrackIds(), playbackReq.getOriginalWaitingTrackIds())) {
            throw PlaybackException.NOT_MATCH_TRACK_LIST
                    .message("waitingTrackIds and originalWaitingTrackIds doesn't match").instance();
        }

        UUID userId = UUID.fromString(UserContext.getUserId());
        playbackRepo.findByOwnerId(userId)
                .ifPresent((playback) -> {
                    queueRepo.findById(playback.getQueueId())
                            .ifPresent((queue) -> {
                                queue.setPlayedTrackIds(playbackReq.getPlayedTrackIds());
                                queue.setWaitingTrackIds(playbackReq.getWaitingTrackIds());

                                queue.setOriginalWaitingTrackIds(playbackReq.getOriginalWaitingTrackIds());
                                queue.setOriginalPlayedTrackIds(playbackReq.getOriginalPlayedTrackIds());
                                queueRepo.save(queue);
                            });

                    playbackStateRepo.findById(playback.getPlaybackStateId())
                            .ifPresent((playbackState) -> {
                                Optional.ofNullable(trackService.getTrack(playbackReq.getTrackId()))
                                        .ifPresent(tDto -> playbackState.setTrackId(tDto.getId()));
                                playbackState.setCurrentSec(playbackReq.getCurrentSec());
                                playbackState.setTrackId(playbackReq.getTrackId());
                                playbackState.setVolume(playbackReq.getVolume());
                                playbackStateRepo.save(playbackState);
                            });
                });

    }

    private boolean validateTrackLists(List<UUID> trackIds1, List<UUID> trackIds2) {
        if (trackIds1.size() != trackIds2.size()) {
            return false;
        }
        Collections.sort(trackIds1);
        Collections.sort(trackIds2);
        for (int i = 0; i < trackIds1.size(); i++) {
            if (!trackIds1.get(i).equals(trackIds2.get(i))) {
                return false;
            }
        }
        return true;
    }

    private Playback getPlayback(UUID ownerId) {
        Playback playback = playbackRepo.findByOwnerId(ownerId)
                .orElseGet(() -> {
                    PlaybackState newPlaybackState = new PlaybackState();
                    newPlaybackState = playbackStateRepo.save(newPlaybackState);

                    Queue newQueue = new Queue();
                    newQueue = queueRepo.save(newQueue);

                    Playback newPlayback = new Playback();
                    newPlayback.setPlaybackStateId(newPlaybackState.getId());
                    newPlayback.setQueueId(newQueue.getId());
                    newPlayback.setOwnerId(ownerId);
                    newPlayback = playbackRepo.save(newPlayback);
                    return newPlayback;
                });
        return playback;
    }

}
