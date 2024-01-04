package tech.datvu.beatbuddy.api.shared.services;

import tech.datvu.beatbuddy.api.shared.services.models.AudioSegmentRequest;
import tech.datvu.beatbuddy.api.shared.services.models.FileDto;

public interface BeatBuddyStorageService {
    FileDto createFile(String localFilePath, String storagePath, boolean replaceIfExist);

    boolean createAudioSegment(AudioSegmentRequest audioSegReq);
}
