package tech.datvu.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import tech.datvu.beatbuddy.api.entity.Search;
import tech.datvu.beatbuddy.api.model.request.SearchRequest;

@Component
public class SearchMapper {
    public Search mapToResource(SearchRequest resourceReq) {
        return resourceReq == null
                ? null
                : Search.builder()
                        .name(resourceReq.getName())
                        .uri(Search.mapUri(resourceReq.getType(), resourceReq.getCode()))
                        .tags(resourceReq.getTags())
                        .type(resourceReq.getType())
                        .build();
    }
}
