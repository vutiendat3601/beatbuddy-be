package vn.io.datvutech.beatbuddy.api.controller;

import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.dto.SearchPageDto;
import vn.io.datvutech.beatbuddy.api.model.ResourceType;
import vn.io.datvutech.beatbuddy.api.model.request.SearchQueryRequest;
import vn.io.datvutech.beatbuddy.api.model.response.Response;
import vn.io.datvutech.beatbuddy.api.service.SearchService;

@RestController
@RequiredArgsConstructor
@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
public class SearchController {
    // ## Services
    private final SearchService searchService;

    /* #: Public */
    @GetMapping("v1/search")
    public ResponseEntity<Response<Map<ResourceType, SearchPageDto>>> search(
            @Valid SearchQueryRequest queryReq) {
        Map<ResourceType, SearchPageDto> searchDtosMap = searchService.search(queryReq);
        return ResponseEntity.ok(Response.success(searchDtosMap));
    }
    /* # Public */
}
