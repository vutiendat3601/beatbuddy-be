package tech.datvu.beatbuddy.storage.file.models;

import static tech.datvu.beatbuddy.storage.shared.global.GlobalConstant.UNIX_ABSOLUTE_PATH_REGEX;

import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import tech.datvu.beatbuddy.storage.shared.utils.validation.FileNotEmpty;

@AllArgsConstructor
@Data
public class FileRequest {
    @NotBlank
    @Pattern(regexp = UNIX_ABSOLUTE_PATH_REGEX, message = "must match UNIX absolute path, file name only accepts [a-z, A-Z, 0-9, _, -], not end with '/'")
    private String path;

    @FileNotEmpty
    private MultipartFile file;

    private Boolean replaceIfExist;

    public FileRequest() {
        replaceIfExist = false;
    }

}
