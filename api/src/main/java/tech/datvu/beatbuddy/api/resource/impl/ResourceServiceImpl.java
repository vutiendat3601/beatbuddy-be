package tech.datvu.beatbuddy.api.resource.impl;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.resource.ResourceRepo;
import tech.datvu.beatbuddy.api.resource.ResourceService;
import tech.datvu.beatbuddy.api.resource.models.Resource;
import tech.datvu.beatbuddy.api.resource.models.ResourceDto;
import tech.datvu.beatbuddy.api.resource.models.ResourceMapper;
import tech.datvu.beatbuddy.api.resource.models.ResourceSearchDto;
import tech.datvu.beatbuddy.api.resource.models.ResourceSearchQueryRequest;
import tech.datvu.beatbuddy.api.shared.utils.PaginationUltil;
import tech.datvu.beatbuddy.api.shared.utils.TextUtil;

@RequiredArgsConstructor
@Service
public class ResourceServiceImpl implements ResourceService {
    // ## Mappers
    private final ResourceMapper resourceMapper;

    // ## Repos
    private final ResourceRepo resourceRepo;

    @Override
    public ResourceSearchDto searchResource(@Valid ResourceSearchQueryRequest queryReq) {
        PaginationUltil.checkPageOffset(queryReq.getPage(), queryReq.getSize());
        Pageable pageReq = PageRequest.of(queryReq.getPage(), queryReq.getSize());

        String keyword = queryReq.getQ();
        keyword = keyword == null ? "" : TextUtil.removeAccents(keyword.trim());
        Page<Resource> resourcePage = resourceRepo.findByTypeInAndKeyword(
                pageReq,
                queryReq.getTypes(),
                keyword);
        Page<ResourceDto> resourceDtoPage = resourcePage.map(resourceMapper::mapResourceDto);
        ResourceSearchDto resourceSearchDto = ResourceSearchDto.parse(resourceDtoPage, queryReq.getTypes());
        return resourceSearchDto;
    }

}
