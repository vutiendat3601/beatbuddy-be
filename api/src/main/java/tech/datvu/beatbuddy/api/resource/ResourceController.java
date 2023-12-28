package tech.datvu.beatbuddy.api.resource;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.resource.models.ResourceSearchDto;
import tech.datvu.beatbuddy.api.resource.models.ResourceSearchQueryRequest;
import tech.datvu.beatbuddy.api.shared.models.Response;

@RestController
@RequiredArgsConstructor
public class ResourceController {
    // ## Services
    private final ResourceService resourceService;

    @GetMapping("v1/search")
    public ResponseEntity<Response<?>> search(
        @Valid ResourceSearchQueryRequest queryReq) {
        ResourceSearchDto resourceSearchDto = resourceService.searchResource(queryReq);
        return ResponseEntity.ok(Response.successPage(resourceSearchDto));
    }
}
