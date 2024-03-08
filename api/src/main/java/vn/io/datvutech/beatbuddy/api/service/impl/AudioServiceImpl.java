package vn.io.datvutech.beatbuddy.api.service.impl;

import java.util.UUID;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.dto.AudioDto;
import vn.io.datvutech.beatbuddy.api.entity.Audio;
import vn.io.datvutech.beatbuddy.api.exception.AudioException;
import vn.io.datvutech.beatbuddy.api.mapper.AudioMapper;
import vn.io.datvutech.beatbuddy.api.repository.AudioRepository;
import vn.io.datvutech.beatbuddy.api.service.AudioService;

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
