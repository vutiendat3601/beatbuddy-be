package tech.datvu.beatbuddy.api.artist.models;

import java.time.LocalDate;
import java.util.UUID;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import tech.datvu.beatbuddy.api.shared.models.AbstractEntity;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@EqualsAndHashCode(callSuper = false)
@Table(name = "artists")
@Entity
public class Artist extends AbstractEntity {
    @Id
    @GeneratedValue(generator = "pg-uuid")
    private UUID id;

    @Column(name = "acc_id")
    private UUID accountId;

    private String refCode;

    private String name;

    private Boolean isVerified;

    private boolean isPublic;

    private String realName;

    private LocalDate birthDate;

    private String description;

    private String nationality;

    @Column(name = "bio")
    private String biography;

    @Column(name = "thumb_img")
    private String thumbnail;

    @Column(name = "bg_img")
    private String backgroundImg;
}
