package tech.datvu.beatbuddy.api.audio.models;

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

@Table(name = "audio_track")
@Entity
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
public class AudioTrack extends AbstractEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private UUID audioId;

    private UUID trackId;

    private boolean isActive;

    public AudioTrack() {
        isActive = true;
    }
}
