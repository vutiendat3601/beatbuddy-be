package tech.datvu.beatbuddy.api.service;

import org.springframework.scheduling.annotation.Async;

import tech.datvu.beatbuddy.api.model.request.SearchRequest;

@Async("backgroundTask")
public interface SearchServiceAsync {
    void createSearch(SearchRequest searchReq);

    void increasePopularity(Iterable<String> uris);
}
