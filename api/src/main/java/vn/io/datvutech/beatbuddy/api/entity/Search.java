package vn.io.datvutech.beatbuddy.api.entity;

import java.util.UUID;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import vn.io.datvutech.beatbuddy.api.model.ResourceType;

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

    
}
