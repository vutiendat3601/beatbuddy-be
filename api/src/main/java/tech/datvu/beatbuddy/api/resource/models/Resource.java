package tech.datvu.beatbuddy.api.resource.models;

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
@Table(name = "resources")
@Entity
public class Resource extends AbstractEntity {
    @Id
    @GeneratedValue(generator = "pg-uuid")
    private UUID id;

    private String name;

    private String uri;

    private String tags;

    @Column(name = "thumb")
    private String thumbnail;
    
    private ResourceType type;

    public static String mapUri(ResourceType type, UUID id) {
        return (type == null || id == null)
                ? null
                : type.name().toLowerCase() + ":" + id;
    }

    public static enum ResourceType  {
        ARTIST, TRACK;

        @JsonValue
        public String json() {
            return name().toLowerCase();
        }
    }

    @Converter(autoApply = true)
    public static class ResourceTypeConverter implements AttributeConverter<ResourceType, String> {
        @Override
        public String convertToDatabaseColumn(ResourceType type) {
            return type == null ? null : type.json();
        }

        @Override
        public ResourceType convertToEntityAttribute(String dbData) {
            return dbData == null ? null : ResourceType.valueOf(dbData.toUpperCase());
        }
    }
}
