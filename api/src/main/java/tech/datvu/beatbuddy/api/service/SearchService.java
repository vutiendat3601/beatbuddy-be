package tech.datvu.beatbuddy.api.service;

import java.util.Map;

import jakarta.validation.Valid;
import tech.datvu.beatbuddy.api.dto.SearchPageDto;
import tech.datvu.beatbuddy.api.model.ResourceType;
import tech.datvu.beatbuddy.api.model.request.SearchQueryRequest;

public interface SearchService {
    Map<ResourceType, SearchPageDto> search(@Valid SearchQueryRequest queryReq);
}
