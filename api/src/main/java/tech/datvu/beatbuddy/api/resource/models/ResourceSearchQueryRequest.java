package tech.datvu.beatbuddy.api.resource.models;

import java.util.Set;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import tech.datvu.beatbuddy.api.resource.models.Resource.ResourceType;
import tech.datvu.beatbuddy.api.shared.models.PageRequest;

@Data
@EqualsAndHashCode(callSuper = true)
public class ResourceSearchQueryRequest extends PageRequest {
    @NotEmpty
    private Set<ResourceType> types;

    @NotBlank
    private String q;
}
