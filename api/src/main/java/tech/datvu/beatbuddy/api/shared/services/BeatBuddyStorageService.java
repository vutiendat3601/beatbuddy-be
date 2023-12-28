package tech.datvu.beatbuddy.api.shared.services;

import tech.datvu.beatbuddy.api.shared.services.models.FileDto;

public interface BeatBuddyStorageService {
    FileDto createFile(String filePath, String path, boolean replaceIfExist);
}
