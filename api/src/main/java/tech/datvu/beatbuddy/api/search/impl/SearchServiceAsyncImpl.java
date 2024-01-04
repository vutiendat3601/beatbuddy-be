package tech.datvu.beatbuddy.api.search.impl;

import java.util.List;
import java.util.UUID;

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

    @Override
    public void increasePriorityById(Iterable<UUID> searchIds) {
        List<Search> searchs = searchRepo.findAllById(searchIds);
        searchs.forEach(s -> s.setPriority(s.getPriority() + 1));
        searchRepo.saveAll(searchs);
    }

    @Override
    public void increasePriorityByUri(Iterable<String> searchUris) {
        List<Search> searchs = searchRepo.findAllByUri(searchUris);
        searchs.forEach(s -> s.setPriority(s.getPriority() + 1));
        searchRepo.saveAll(searchs);
    }

}
