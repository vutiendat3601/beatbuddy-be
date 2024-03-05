package tech.datvu.beatbuddy.api.entity;

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

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@EqualsAndHashCode(callSuper = false)
@Table(name = "tracks")
@Entity
public class Track extends AbstractEntity {
    @Id
    @GeneratedValue(generator = "pg-uuid")
    private UUID id;

    private String refCode;

    private String name;

    private boolean isPublic;

    private String description;

    private String releasedDate;

    private Long durationSec;

    private boolean isPlayable;

    @Column(name = "thumb_img")
    private String thumbnail;

    public static final String[] TRACK_SORT_FIELDS = {
            "id", "name", "url", "releasedDate", "description", "durationSec", "createdAt", "updatedAt"
    };
}
