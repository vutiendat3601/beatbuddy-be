package tech.datvu.beatbuddy.api.track.models;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonValue;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Column;
import jakarta.persistence.Converter;
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

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@EqualsAndHashCode(callSuper = false)
@Table(name = "track_suggestions")
@Entity
public class TrackSuggestion extends AbstractEntity {
    @Id
    @GeneratedValue(generator = "pg-uuid")
    private UUID id;

    @Column(name = "thumb_img")
    private String thumbnail;

    private String name;

    private String url;

    private String releasedDate;

    private String description;

    private String lyrics;

    private String tags;

    private UUID trackId;

    private String audioRefCode;

    private Status status;

    public static enum Status {
        PENDING, PROCCESSING, PROCESSED;

        @JsonValue
        public String json() {
            return name().toLowerCase();
        }
    }

    @Converter(autoApply = true)
    public static class StatusConverter implements AttributeConverter<Status, String> {
        @Override
        public String convertToDatabaseColumn(Status status) {
            return status == null ? null : status.json();
        }

        @Override
        public Status convertToEntityAttribute(String dbData) {
            return dbData == null ? null : Status.valueOf(dbData.toUpperCase());
        }
    }
}
