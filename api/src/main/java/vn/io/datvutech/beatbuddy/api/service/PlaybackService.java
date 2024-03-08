package vn.io.datvutech.beatbuddy.api.service;

import vn.io.datvutech.beatbuddy.api.dto.PlaybackDto;
import vn.io.datvutech.beatbuddy.api.model.request.PlaybackRequest;

public interface PlaybackService {
    PlaybackDto getUserPlayback();

    void updateUserPlayback(PlaybackRequest playbackReq);
}
