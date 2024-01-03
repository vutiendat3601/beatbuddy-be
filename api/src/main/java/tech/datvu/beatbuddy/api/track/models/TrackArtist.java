package tech.datvu.beatbuddy.api.track.models;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import tech.datvu.beatbuddy.api.shared.models.AbstractEntity;

@Data
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Table(name = "track_artist")
@Entity
public class TrackArtist extends AbstractEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private UUID trackId;

    private UUID artistId;

    private boolean isActive;

    public TrackArtist() {
        isActive = true;
    }
}
