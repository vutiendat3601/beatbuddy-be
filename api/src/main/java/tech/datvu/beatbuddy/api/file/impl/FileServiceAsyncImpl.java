package tech.datvu.beatbuddy.api.file.impl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import tech.datvu.beatbuddy.api.file.FileServiceAsync;
import tech.datvu.beatbuddy.api.shared.services.BeatBuddyStorageService;
import tech.datvu.beatbuddy.api.shared.services.models.FileDto;
import tech.datvu.beatbuddy.api.shared.utils.FileUtil;

@Service
@Slf4j
@RequiredArgsConstructor
public class FileServiceAsyncImpl implements FileServiceAsync {
    // ## Services
    private final BeatBuddyStorageService storageService;

    @Override
    public void saveFileToStorage(String localFilePath, String storagePath, boolean replaceIfExist) {
        FileDto fileDto = storageService.createFile(localFilePath, storagePath, replaceIfExist);
        if (fileDto != null) {
            String hashMd5 = FileUtil.hashMd5(localFilePath);
            if (hashMd5 != null && hashMd5.equals(fileDto.getHashMd5())) {
                try {
                    Files.deleteIfExists(Path.of(localFilePath));
                } catch (IOException e) {
                    log.error(e.getMessage(), e);
                }
            }
        }
    }
}
