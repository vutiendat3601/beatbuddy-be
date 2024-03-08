package vn.io.datvutech.beatbuddy.api.model.request;

import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import vn.io.datvutech.beatbuddy.api.util.validation.ContentType;

@AllArgsConstructor
@Data
public class PlaylistRequest {
    public static interface Update {
    };

    @ContentType(accepts = { MediaType.IMAGE_JPEG_VALUE, MediaType.IMAGE_PNG_VALUE })
    private MultipartFile thumbnail;

    @NotBlank
    private String name;

    @NotNull
    private Boolean isPublic;

    private String description;

    @NotEmpty(groups = { Update.class })
    private Set<UUID> trackIds;

    @NotNull
    private Boolean isTrackRemove;

    public PlaylistRequest() {
        trackIds = new HashSet<>();
        isPublic = false;
        isTrackRemove = false;
    }
}
