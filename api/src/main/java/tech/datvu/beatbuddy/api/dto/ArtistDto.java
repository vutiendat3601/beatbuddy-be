package tech.datvu.beatbuddy.api.dto;

import java.time.LocalDate;
import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ArtistDto {
    private UUID id;

    @JsonIgnore
    private UUID accountId;

    @JsonIgnore
    private String refCode;

    private String name;
    
    private String realName;

    private LocalDate birthDate;

    private String description;

    private String nationality;

    private String biography;

    @JsonProperty("isVerified")
    private Boolean isVerified;

    @JsonProperty("isPublic")
    private boolean isPublic;

    private String thumbnail;

    private String backgroundImg;
}
