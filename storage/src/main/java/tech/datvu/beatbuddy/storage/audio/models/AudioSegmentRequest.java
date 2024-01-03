package tech.datvu.beatbuddy.storage.audio.models;

import static tech.datvu.beatbuddy.storage.shared.global.GlobalConstant.UNIX_ABSOLUTE_PATH_REGEX;

import com.fasterxml.jackson.annotation.JsonValue;

import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class AudioSegmentRequest {
    @NotEmpty
    @Pattern(regexp = UNIX_ABSOLUTE_PATH_REGEX, message = "must match UNIX absolute path, file name only accepts [a-z, A-Z, 0-9, _, -], not end with '/'")
    private String audioPath;

    @NotEmpty
    @Pattern(regexp = UNIX_ABSOLUTE_PATH_REGEX, message = "must match UNIX absolute path, file name only accepts [a-z, A-Z, 0-9, _, -], not end with '/'")
    private String m3u8Path;

    @NotNull
    private Boolean deleteFileAfterSplitted;

    private AudioQuality quality;

    public AudioSegmentRequest() {
        deleteFileAfterSplitted = false;
        quality = AudioQuality.KBPS128;
    }

    public static enum AudioQuality {
        KBPS128("128"), KBPS320("320");

        private String value;

        private AudioQuality(String value) {
            this.value = value;
        }

        public String value() {
            return value;
        }

        @JsonValue
        public String json() {
            return name().toLowerCase();
        }
    }
}
