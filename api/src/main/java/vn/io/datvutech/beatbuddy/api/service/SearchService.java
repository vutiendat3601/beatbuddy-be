package vn.io.datvutech.beatbuddy.api.service;

import java.util.Map;

import jakarta.validation.Valid;
import vn.io.datvutech.beatbuddy.api.dto.SearchPageDto;
import vn.io.datvutech.beatbuddy.api.model.ResourceType;
import vn.io.datvutech.beatbuddy.api.model.request.SearchQueryRequest;

public interface SearchService {
    Map<ResourceType, SearchPageDto> search(@Valid SearchQueryRequest queryReq);
}
