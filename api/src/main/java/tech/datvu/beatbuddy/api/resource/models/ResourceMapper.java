package tech.datvu.beatbuddy.api.resource.models;

import org.springframework.stereotype.Component;

@Component
public class ResourceMapper {
    public Resource mapToResource(ResourceRequest resourceReq) {
        return Resource.builder()
                .name(resourceReq.getName())
                .urn(Resource.mapUrn(resourceReq.getType(), resourceReq.getCode()))
                .tags(resourceReq.getTags())
                .thumbnail(resourceReq.getThumbnail())
                .type(resourceReq.getType())
                .build();
    }

    public ResourceDto mapResourceDto(Resource resource) {
        return ResourceDto.builder()
                .id(resource.getId())
                .name(resource.getName())
                .urn(resource.getUrn())
                .tags(resource.getTags())
                .thumbnail(resource.getThumbnail())
                .type(resource.getType())
                .build();
    }
}
