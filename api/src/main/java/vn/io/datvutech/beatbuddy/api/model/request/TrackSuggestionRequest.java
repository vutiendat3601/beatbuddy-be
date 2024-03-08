package vn.io.datvutech.beatbuddy.api.model.request;

import static vn.io.datvutech.beatbuddy.api.global.GlobalConstant.URL_REGEX;

import java.util.Set;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import vn.io.datvutech.beatbuddy.api.util.validation.ContentType;
import vn.io.datvutech.beatbuddy.api.util.validation.IsoDate;

@AllArgsConstructor
@Data
public class TrackSuggestionRequest {
    @ContentType(accepts = { MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE })
    private MultipartFile thumbnail;

    @NotBlank
    private String name;

    private Set<UUID> artists;

    @Pattern(regexp = URL_REGEX, message = "is wrong url format")
    @NotBlank
    private String url;

    @IsoDate
    private String releasedDate;

    private String description;

    private String lyrics;

    public TrackSuggestionRequest() {
        artists = Set.of();
    }
}
