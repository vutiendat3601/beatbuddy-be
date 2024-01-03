package tech.datvu.beatbuddy.api.resource.models;

import java.util.List;
import java.util.Set;

import org.springframework.data.domain.Page;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import tech.datvu.beatbuddy.api.resource.models.Resource.ResourceType;
import tech.datvu.beatbuddy.api.shared.models.PageResponse.PageMetadata;
import tech.datvu.beatbuddy.api.shared.models.PageResponse.Pageable;

@Data
@Builder
@AllArgsConstructor
public class ResourceSearchDto implements Pageable {
    private List<ResourceDto> artists;

    private List<ResourceDto> tracks;

    @JsonIgnore
    private PageMetadata metadata;

    private ResourceSearchDto() {
        metadata = new PageMetadata();
    }

    public static ResourceSearchDto parse(Page<ResourceDto> resourceDtoPage, Set<ResourceType> types) {
        ResourceSearchDto resourceSearchDto = new ResourceSearchDto();
        if (resourceDtoPage != null) {
            resourceSearchDto.setMetadata(PageMetadata.of(resourceDtoPage));
            resourceSearchDto.setArtists(
                    types.contains(ResourceType.ARTIST)
                            ? parse(resourceDtoPage.getContent(), ResourceType.ARTIST)
                            : null);
            resourceSearchDto.setTracks(
                    types.contains(ResourceType.TRACK)
                            ? parse(resourceDtoPage.getContent(), ResourceType.TRACK)
                            : null);
        }
        return resourceSearchDto;
    }

    private static List<ResourceDto> parse(List<ResourceDto> resources, ResourceType type) {
        return resources.stream().filter(r -> r.getType() == type).toList();
    }

    @Override
    public PageMetadata getMetadata() {
        return metadata;
    }
}
