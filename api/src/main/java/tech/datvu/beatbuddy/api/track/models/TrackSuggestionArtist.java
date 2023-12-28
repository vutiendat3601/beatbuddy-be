package tech.datvu.beatbuddy.api.track.models;

import java.util.UUID;

import org.hibernate.annotations.SQLRestriction;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import tech.datvu.beatbuddy.api.shared.models.AbstractEntity;

@Builder
@AllArgsConstructor
@Data
@SQLRestriction("is_active = true")
@EqualsAndHashCode(callSuper = false)
@Table(name = "tracksuggestion_artist")
@Entity
public class TrackSuggestionArtist extends AbstractEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "tracksugg_id")
    private UUID trackSuggestionId;

    private UUID artistId;

    private boolean isActive;

    public TrackSuggestionArtist() {
        isActive = true;
    }
}
