package tech.datvu.beatbuddy.api.search.impl;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.search.SearchRepo;
import tech.datvu.beatbuddy.api.search.SearchServiceAsync;
import tech.datvu.beatbuddy.api.search.models.Search;
import tech.datvu.beatbuddy.api.search.models.SearchMapper;
import tech.datvu.beatbuddy.api.search.models.SearchRequest;

@RequiredArgsConstructor
@Service
public class SearchServiceAsyncImpl implements SearchServiceAsync {
    // ## Mappers
    private final SearchMapper searchMapper;

    // ## Repos
    private final SearchRepo searchRepo;

    @Override
    public void createSearch(SearchRequest searchReq) {
        Search resource = searchMapper.mapToResource(searchReq);
        resource = searchRepo.save(resource);
    }

}
