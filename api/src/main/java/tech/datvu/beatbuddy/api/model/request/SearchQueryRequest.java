package tech.datvu.beatbuddy.api.model.request;

import java.util.Set;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import tech.datvu.beatbuddy.api.model.ResourceType;

@Data
@EqualsAndHashCode(callSuper = true)
public class SearchQueryRequest extends PaginationRequest {
    @NotEmpty
    private Set<ResourceType> types;

    @NotBlank
    private String q;
}
