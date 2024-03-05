package tech.datvu.beatbuddy.api.model.request;

import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.Data;
import tech.datvu.beatbuddy.api.model.ResourceType;

@AllArgsConstructor
@Data
public class SearchRequest {
    private String name;

    private String tags;

    private String thumbnail;

    private ResourceType type;
    
    private UUID resourceId;

    public SearchRequest() {
        tags = "";
    }
}
