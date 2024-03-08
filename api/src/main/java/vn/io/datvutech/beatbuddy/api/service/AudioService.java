package vn.io.datvutech.beatbuddy.api.service;

import java.util.UUID;

import vn.io.datvutech.beatbuddy.api.dto.AudioDto;

public interface AudioService {
    AudioDto getAudio(UUID audioId);
}
