package tech.datvu.beatbuddy.api.resource.models;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Data;
import tech.datvu.beatbuddy.api.resource.models.Resource.ResourceType;

@AllArgsConstructor
@Data
public class ResourceRequest {
    private String name;

    private String tags;

    private String thumbnail;

    private ResourceType type;
    
    private UUID code;

    public ResourceRequest() {
        tags = "";
    }
}
