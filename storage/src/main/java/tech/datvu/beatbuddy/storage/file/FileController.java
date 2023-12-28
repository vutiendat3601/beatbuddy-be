package tech.datvu.beatbuddy.storage.file;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.storage.file.models.FileDto;
import tech.datvu.beatbuddy.storage.file.models.FileRequest;
import tech.datvu.beatbuddy.storage.shared.models.Response;

@RestController
@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
@RequiredArgsConstructor
public class FileController {
    private final FileService fileService;

    @PostMapping(value = "v1/storage/files", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public ResponseEntity<Response<FileDto>> createFile(@Valid FileRequest fileReq) {
        FileDto fileDto = fileService.createFile(fileReq);
        return ResponseEntity.ok(Response.success(fileDto));
    }
}
