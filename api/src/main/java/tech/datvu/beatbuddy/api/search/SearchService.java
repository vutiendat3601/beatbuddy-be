package tech.datvu.beatbuddy.api.search;

import java.util.Map;

import jakarta.validation.Valid;
import tech.datvu.beatbuddy.api.search.models.SearchPageDto;
import tech.datvu.beatbuddy.api.search.models.SearchQueryRequest;
import tech.datvu.beatbuddy.api.search.models.Search.ResourceType;

public interface SearchService {
      Map<ResourceType, SearchPageDto> search(@Valid SearchQueryRequest queryReq);
}
