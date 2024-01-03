package tech.datvu.beatbuddy.api.search.models;

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

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
@EqualsAndHashCode(callSuper = false)
@Table(name = "searchs")
@Entity
public class Search extends AbstractEntity {
    @Id
    @GeneratedValue(generator = "pg-uuid")
    private UUID id;

    private String name;

    private String uri;

    private String tags;

    private ResourceType type;

    public static String mapUri(ResourceType type, UUID id) {
        return (type == null || id == null)
                ? null
                : type.name().toLowerCase() + ":" + id;
    }

    public static UUID getIdFromUri(Search resource) {
        if (resource != null) {
            String uri = resource.getUri();
            return uri == null ? null : UUID.fromString(uri.split(":")[1]);
        }
        return null;
    }

    public static enum ResourceType {
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
