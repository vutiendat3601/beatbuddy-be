package tech.datvu.beatbuddy.api.track.models;

import java.util.Set;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import tech.datvu.beatbuddy.api.shared.utils.validation.ContentType;
import tech.datvu.beatbuddy.api.shared.utils.validation.IsoDate;

@AllArgsConstructor
@Data
public class TrackSuggestionRequest {
    @ContentType(accepts = { MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE })
    private MultipartFile thumbnail;

    @NotBlank
    private String title;

    private Set<UUID> artists;

    @Pattern(regexp = "^https?:\\/\\/(?:www\\.)?[-a-zA-Z0-9@:%._\\+~#=]{1,256}\\.[a-zA-Z0-9()]{1,6}\\b(?:[-a-zA-Z0-9()@:%_\\+.~#?&\\/=]*)$", message = "is wrong format")
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
