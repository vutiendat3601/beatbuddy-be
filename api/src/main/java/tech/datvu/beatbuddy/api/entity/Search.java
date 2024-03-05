package tech.datvu.beatbuddy.api.entity;

import java.util.UUID;

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
import tech.datvu.beatbuddy.api.model.ResourceType;

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

    private long popularity;

    public static UUID getIdFromUri(Search resource) {
        UUID id = null;
        if (resource != null) {
            String uri = resource.getUri();
            String[] tokens = uri == null ? new String[] {} : uri.split(":");
            try {
                id = tokens.length == 3 ? UUID.fromString(tokens[2]) : id;
            } catch (Exception e) {
                id = null;
            }
        }
        return id;
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
