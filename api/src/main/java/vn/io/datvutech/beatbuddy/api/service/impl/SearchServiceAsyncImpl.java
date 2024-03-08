package vn.io.datvutech.beatbuddy.api.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.entity.Search;
import vn.io.datvutech.beatbuddy.api.mapper.SearchMapper;
import vn.io.datvutech.beatbuddy.api.model.request.SearchRequest;
import vn.io.datvutech.beatbuddy.api.repository.SearchRepository;
import vn.io.datvutech.beatbuddy.api.service.SearchServiceAsync;

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
