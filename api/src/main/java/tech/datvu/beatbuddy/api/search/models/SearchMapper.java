package tech.datvu.beatbuddy.api.search.models;

import org.springframework.stereotype.Component;

@Component
public class SearchMapper {
    public Search mapToResource(SearchRequest resourceReq) {
        return Search.builder()
                .name(resourceReq.getName())
                .uri(Search.mapUri(resourceReq.getType(), resourceReq.getCode()))
                .tags(resourceReq.getTags())
                .type(resourceReq.getType())
                .build();
    }
}
