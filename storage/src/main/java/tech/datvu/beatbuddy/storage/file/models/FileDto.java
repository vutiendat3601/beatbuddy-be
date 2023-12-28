package tech.datvu.beatbuddy.storage.file.models;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
@Builder
public class FileDto implements Serializable {
    private String hashMd5;

    private String path;

    @JsonProperty("isReplaced")
    private boolean isReplaced;
}
