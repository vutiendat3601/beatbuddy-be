package tech.datvu.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import tech.datvu.beatbuddy.api.entity.Search;
import tech.datvu.beatbuddy.api.model.ResourceType;
import tech.datvu.beatbuddy.api.model.request.SearchRequest;

@Component
public class SearchMapper {
    public Search mapToResource(SearchRequest resourceReq) {
        return resourceReq == null
                ? null
                : Search.builder()
                        .name(resourceReq.getName())
                        .uri(
                                ResourceType.mapUri(
                                        resourceReq.getType(),
                                        resourceReq.getResourceId()

                                )

                        )
                        .tags(resourceReq.getTags())
                        .type(resourceReq.getType())
                        .build();
    }
}
