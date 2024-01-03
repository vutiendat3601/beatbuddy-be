package tech.datvu.beatbuddy.api.search;

import org.springframework.scheduling.annotation.Async;

import tech.datvu.beatbuddy.api.search.models.SearchRequest;

@Async("backgroundTask")
public interface SearchServiceAsync {
    void createSearch(SearchRequest searchReq);
}
