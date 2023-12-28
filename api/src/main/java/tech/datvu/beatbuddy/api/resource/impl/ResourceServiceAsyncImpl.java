package tech.datvu.beatbuddy.api.resource.impl;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.resource.ResourceRepo;
import tech.datvu.beatbuddy.api.resource.ResourceServiceAsync;
import tech.datvu.beatbuddy.api.resource.models.Resource;
import tech.datvu.beatbuddy.api.resource.models.ResourceMapper;
import tech.datvu.beatbuddy.api.resource.models.ResourceRequest;

@RequiredArgsConstructor
@Service
public class ResourceServiceAsyncImpl implements ResourceServiceAsync {

    // ## Mappers
    private final ResourceMapper resourceMapper;

    // ## Repos
    private final ResourceRepo resourceRepo;

    @Override
    public void createResource(ResourceRequest resourceReq) {
        Resource resource = resourceMapper.mapToResource(resourceReq);
        resource = resourceRepo.save(resource);
    }

}
