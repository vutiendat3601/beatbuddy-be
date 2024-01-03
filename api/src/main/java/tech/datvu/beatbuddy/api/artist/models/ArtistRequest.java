package tech.datvu.beatbuddy.api.artist.models;

import java.time.LocalDate;

import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import tech.datvu.beatbuddy.api.shared.utils.validation.ContentType;

@AllArgsConstructor
@Data
public class ArtistRequest {
    public interface Update {
    }

    @NotBlank
    private String name;

    private String realName;

    private LocalDate birthDate;

    private String description;

    private String biography;

    private Boolean isVerified;

    private Boolean isPublic;
    
    @Pattern(regexp = "^[A-Z|a-z]{2}$", message = "must exactly have 2 English alphabet characters")
    private String nationality;

    @ContentType(accepts = { MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE })
    private MultipartFile thumbnail;

    @ContentType(accepts = { MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE })
    private MultipartFile backgroundImg;

    public ArtistRequest() {
        isVerified = false;
    }
}
