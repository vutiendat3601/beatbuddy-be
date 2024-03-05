package tech.datvu.beatbuddy.api.service.impl;

import java.util.UUID;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.dto.AudioDto;
import tech.datvu.beatbuddy.api.entity.Audio;
import tech.datvu.beatbuddy.api.exception.AudioException;
import tech.datvu.beatbuddy.api.mapper.AudioMapper;
import tech.datvu.beatbuddy.api.repository.AudioRepository;
import tech.datvu.beatbuddy.api.service.AudioService;

@RequiredArgsConstructor
@Service
public class AudioServiceImpl implements AudioService {

    private final AudioRepository audioRepo;

    private final AudioMapper audioMapper;

    @Override
    public AudioDto getAudio(UUID audioId) {
        Audio audio = audioRepo.findById(audioId)
                .orElseThrow(() -> AudioException.AUDIO_NOT_FOUND.instance());
        return audioMapper.mapToAudioDto(audio);
    }

}
