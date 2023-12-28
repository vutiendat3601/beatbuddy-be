package tech.datvu.beatbuddy.api.resource;

import jakarta.validation.Valid;
import tech.datvu.beatbuddy.api.resource.models.ResourceSearchDto;
import tech.datvu.beatbuddy.api.resource.models.ResourceSearchQueryRequest;

public interface ResourceService {
    ResourceSearchDto searchResource(@Valid ResourceSearchQueryRequest queryReq);
}
