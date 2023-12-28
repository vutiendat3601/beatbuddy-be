package tech.datvu.beatbuddy.api.file.impl;

import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.STORAGE_DIR;

import java.io.IOException;
import java.io.InputStream;
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
    public void saveFile(
            InputStream inpStream,
            String outFile,
            boolean replaceIfExist) {
        // ## Save to local disk
        FileServiceAsync.super.saveFile(inpStream, outFile, replaceIfExist);

        final String LOCAL_OUT_FILE = STORAGE_DIR + outFile;
        FileDto fileDto = storageService.createFile(LOCAL_OUT_FILE, outFile, replaceIfExist);
        if (fileDto != null) {
            String hashMd5 = FileUtil.hashMd5(LOCAL_OUT_FILE);
            if (hashMd5 != null && hashMd5.equals(fileDto.getHashMd5())) {
                try {
                    Files.deleteIfExists(Path.of(LOCAL_OUT_FILE));
                } catch (IOException e) {
                    log.error(e.getMessage(), e);
                }
            }
        }
    }
}
