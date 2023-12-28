package tech.datvu.beatbuddy.api.resource;

import org.springframework.scheduling.annotation.Async;

import tech.datvu.beatbuddy.api.resource.models.ResourceRequest;

@Async("backgroundTask")
public interface ResourceServiceAsync {
    void createResource(ResourceRequest resourceDto);
}
