package tech.datvu.beatbuddy.api.service;

import java.util.UUID;

import org.springframework.scheduling.annotation.Async;

import tech.datvu.beatbuddy.api.model.request.SearchRequest;

@Async("backgroundTask")
public interface SearchServiceAsync {
    void createSearch(SearchRequest searchReq);

    void increasePriorityById(Iterable<UUID> searchIds);

    void increasePriorityByUri(Iterable<String> searchUris);
}
