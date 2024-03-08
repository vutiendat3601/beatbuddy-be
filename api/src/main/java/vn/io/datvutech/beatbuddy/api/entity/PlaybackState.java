package vn.io.datvutech.beatbuddy.api.entity;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
@Table(name = "playback_state")
@Entity
public class PlaybackState extends AbstractEntity {
    @Id
    @GeneratedValue(generator = "pg-uuid")
    private UUID id;

    private UUID trackId;

    private float currentSec;

    private float volume;

    public PlaybackState() {
        volume = 1;
    }
}
