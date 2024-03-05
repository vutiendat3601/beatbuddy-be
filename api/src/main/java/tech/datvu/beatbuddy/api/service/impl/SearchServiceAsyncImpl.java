package tech.datvu.beatbuddy.api.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.entity.Search;
import tech.datvu.beatbuddy.api.mapper.SearchMapper;
import tech.datvu.beatbuddy.api.model.request.SearchRequest;
import tech.datvu.beatbuddy.api.repository.SearchRepository;
import tech.datvu.beatbuddy.api.service.SearchServiceAsync;

@RequiredArgsConstructor
@Service
public class SearchServiceAsyncImpl implements SearchServiceAsync {
    // ## Mappers
    private final SearchMapper searchMapper;

    // ## Repos
    private final SearchRepository searchRepo;

    @Override
    public void createSearch(SearchRequest searchReq) {
        Search resource = searchMapper.mapToResource(searchReq);
        resource = searchRepo.save(resource);
    }

    @Override
    public void increasePopularity(Iterable<String> uris) {
        List<Search> searchs = searchRepo.findAllByUriIn(uris);
        searchs.forEach(s -> s.setPopularity(s.getPopularity() + 1));
        searchRepo.saveAll(searchs);
    }

}
