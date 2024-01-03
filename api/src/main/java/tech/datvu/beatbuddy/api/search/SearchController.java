package tech.datvu.beatbuddy.api.search;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.search.models.SearchPageDto;
import tech.datvu.beatbuddy.api.search.models.SearchQueryRequest;
import tech.datvu.beatbuddy.api.search.models.Search.ResourceType;
import tech.datvu.beatbuddy.api.shared.models.Response;

@RestController
@RequiredArgsConstructor
public class SearchController {
    // ## Services
    private final SearchService searchService;

    @GetMapping("v1/search")
    public ResponseEntity<Response<Map<ResourceType, SearchPageDto>>> search(
            @Valid SearchQueryRequest queryReq) {
        Map<ResourceType, SearchPageDto> searchDtosMap = searchService.search(queryReq);
        return ResponseEntity.ok(Response.success(searchDtosMap));
    }
}
