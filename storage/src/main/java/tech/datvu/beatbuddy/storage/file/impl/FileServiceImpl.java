package tech.datvu.beatbuddy.storage.file.impl;

import static tech.datvu.beatbuddy.storage.shared.global.GlobalConstant.STORAGE_DIR;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import tech.datvu.beatbuddy.storage.file.FileService;
import tech.datvu.beatbuddy.storage.file.models.FileDto;
import tech.datvu.beatbuddy.storage.file.models.FileRequest;
import tech.datvu.beatbuddy.storage.shared.utils.FileUtil;

@Service
@Slf4j
@RequiredArgsConstructor
public class FileServiceImpl implements FileService {
    @Override
    public FileDto createFile(FileRequest fileReq) {
        MultipartFile file = fileReq.getFile();
        final String FILE_PATH = STORAGE_DIR + fileReq.getPath();
        if (file == null || file.isEmpty()) {
            return null;
        }
        boolean isDeleted = false;
        try {
            if (fileReq.getReplaceIfExist()) {
                isDeleted = Files.deleteIfExists(Path.of(FILE_PATH));
                FileUtil.saveFile(file.getInputStream(), FILE_PATH);
            } else {
                FileUtil.saveFile(file.getInputStream(), FILE_PATH);
            }

        } catch (IOException e) {
            log.error(e.getMessage(), e);
        }
        String hashMd5 = FileUtil.hashMd5(FILE_PATH);
        return FileDto.builder()
                .hashMd5(hashMd5)
                .path(fileReq.getPath())
                .isReplaced(isDeleted)
                .build();
    }
}
