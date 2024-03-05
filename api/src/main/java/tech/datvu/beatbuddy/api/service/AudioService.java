package tech.datvu.beatbuddy.api.service;

import java.util.UUID;

import tech.datvu.beatbuddy.api.dto.AudioDto;

public interface AudioService {
    AudioDto getAudio(UUID audioId);
}
