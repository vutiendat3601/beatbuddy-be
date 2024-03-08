package vn.io.datvutech.beatbuddy.api.entity;

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

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Data
@EqualsAndHashCode(callSuper = false)
@Entity
@Table(name = "playlists")
public class Playlist extends AbstractEntity {
    @Id
    @GeneratedValue(generator = "pg-uuid")
    private UUID id;

    private String name;

    private boolean isPublic;

    private String description;

    private long durationSec;

    @Column(name = "thumb_img")
    private String thumbnail;

    public static final String[] PLAYLIST_SORT_FIELDS = {
            "id", "name", "createdAt", "updatedAt"
    };
}
