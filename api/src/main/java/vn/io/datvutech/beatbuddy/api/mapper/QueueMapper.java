package vn.io.datvutech.beatbuddy.api.mapper;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.dto.QueueDto;
import vn.io.datvutech.beatbuddy.api.dto.QueueDto.OriginalTrackList;
import vn.io.datvutech.beatbuddy.api.entity.Queue;

@Component
@RequiredArgsConstructor
public class QueueMapper {

    public QueueDto mapToQueueDto(Queue queue) {
        return QueueDto.builder()
                .playedTracks(List.of())
                .waitingTracks(List.of())
                .repeatMode(queue.getRepeatMode())
                .isShuffled(queue.isShuffled())
                .originals(new OriginalTrackList())
                .build();
    }
}
