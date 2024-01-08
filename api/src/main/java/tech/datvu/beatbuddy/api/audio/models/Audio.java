package tech.datvu.beatbuddy.api.audio.models;

import java.util.UUID;

import com.fasterxml.jackson.annotation.JsonValue;

import jakarta.persistence.AttributeConverter;
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

@Builder
@EqualsAndHashCode(callSuper = false)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "audios")
@Entity
public class Audio extends AbstractEntity {
    @Id
    @GeneratedValue(generator = "pg-uuid")
    private UUID id;

    private String refCode;

    private String url;

    private AudioQuality quality;

    public static enum AudioQuality {
        KBPS128("128"), KBPS320("320");

        private String value;

        private AudioQuality(String value) {
            this.value = value;
        }

        public String value() {
            return value;
        }

        @JsonValue
        public String json() {
            return name().toLowerCase();
        }
    }

    @Converter(autoApply = true)
    public static class AudioQualityConverter implements AttributeConverter<AudioQuality, String> {
        @Override
        public String convertToDatabaseColumn(AudioQuality quality) {
            return quality == null ? null : quality.json();
        }

        @Override
        public AudioQuality convertToEntityAttribute(String dbData) {
            return dbData == null ? null : AudioQuality.valueOf(dbData.toUpperCase());
        }
    }
}
