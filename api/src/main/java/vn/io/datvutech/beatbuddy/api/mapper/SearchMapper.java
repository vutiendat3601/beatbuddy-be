package vn.io.datvutech.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import vn.io.datvutech.beatbuddy.api.entity.Search;
import vn.io.datvutech.beatbuddy.api.model.ResourceType;
import vn.io.datvutech.beatbuddy.api.model.request.SearchRequest;

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
