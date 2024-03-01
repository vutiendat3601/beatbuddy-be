package tech.datvu.beatbuddy.api.service;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {
    String saveImageFile(MultipartFile file, boolean isPublic);

    String saveLyricsFile(String lyrics, boolean isPublic);
}
