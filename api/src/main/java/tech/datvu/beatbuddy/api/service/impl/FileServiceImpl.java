package tech.datvu.beatbuddy.api.service.impl;

import static tech.datvu.beatbuddy.api.global.GlobalConstant.FILE_TYPE_IMAGE;
import static tech.datvu.beatbuddy.api.global.GlobalConstant.FILE_TYPE_LYRICS;
import static tech.datvu.beatbuddy.api.global.GlobalConstant.LYRICS_FORMAT;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import tech.datvu.beatbuddy.api.service.FileService;
import tech.datvu.beatbuddy.api.service.FileServiceAsync;
import tech.datvu.beatbuddy.api.util.TextUtil;

@Service
@RequiredArgsConstructor
@Slf4j
public class FileServiceImpl implements FileService {

    @Override
    public String saveLyricsFile(String lyrics, boolean isPublic) {
        if (lyrics != null && (lyrics = lyrics.trim()).length() > 0) {
            String hashMd5 = TextUtil.hashMd5(lyrics);
            String simpleFileName = "%s.%s".formatted(hashMd5, LYRICS_FORMAT);
            String outFile = "/%s/%s".formatted(FILE_TYPE_LYRICS, simpleFileName);
            outFile = isPublic ? "/public" + outFile : outFile;
            FileServiceAsync.saveFileToLocal(
                    new ByteArrayInputStream(lyrics.getBytes()),
                    outFile,
                    false);
            return outFile;
        }
        return null;
    }

    @Override
    public String saveImageFile(MultipartFile file, boolean isPublic) {
        return file == null ? null : saveFile(file, FILE_TYPE_IMAGE, isPublic);
    }

    private String saveFile(MultipartFile file, String fileType, boolean isPublic) {
        try {
            String extension = FilenameUtils.getExtension(file.getOriginalFilename());
            byte[] bytes = file.getResource().getContentAsByteArray();
            String hashMd5 = TextUtil.hashMd5(new String(bytes));
            String simpleFileName = "%s.%s".formatted(hashMd5, extension);
            String outFile = "/%s/%s".formatted(fileType, simpleFileName);
            outFile = isPublic ? "/public" + outFile : outFile;
            FileServiceAsync.saveFileToLocal(
                    new ByteArrayInputStream(bytes),
                    outFile,
                    false);
            return outFile;
        } catch (IOException e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }
}
