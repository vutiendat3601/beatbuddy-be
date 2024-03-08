package vn.io.datvutech.beatbuddy.api.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.dto.ArtistDto;
import vn.io.datvutech.beatbuddy.api.dto.SearchDto;
import vn.io.datvutech.beatbuddy.api.dto.SearchPageDto;
import vn.io.datvutech.beatbuddy.api.dto.TrackDto;
import vn.io.datvutech.beatbuddy.api.entity.Search;
import vn.io.datvutech.beatbuddy.api.exception.CommonException;
import vn.io.datvutech.beatbuddy.api.model.PageMetadata;
import vn.io.datvutech.beatbuddy.api.model.ResourceType;
import vn.io.datvutech.beatbuddy.api.model.request.SearchQueryRequest;
import vn.io.datvutech.beatbuddy.api.repository.SearchRepository;
import vn.io.datvutech.beatbuddy.api.service.ArtistService;
import vn.io.datvutech.beatbuddy.api.service.SearchService;
import vn.io.datvutech.beatbuddy.api.service.TrackService;
import vn.io.datvutech.beatbuddy.api.util.PaginationUtil;
import vn.io.datvutech.beatbuddy.api.util.TextUtil;

@RequiredArgsConstructor
@Service
public class SearchServiceImpl implements SearchService {
    // ## Repos
    private final SearchRepository searchRepo;

    // ## Services
    private final TrackService trackService;
    private final ArtistService artistService;

    @Override
    public Map<ResourceType, SearchPageDto> search(@Valid SearchQueryRequest queryReq) {
        Pageable pageReq = PaginationUtil.parsePagination(queryReq.getPage(), queryReq.getSize());
        final String keyword = queryReq.getQ() == null ? "" : TextUtil.removeAccents(queryReq.getQ().trim());
        Set<ResourceType> types = queryReq.getTypes();
        final Map<ResourceType, SearchPageDto> searchDtosMap = new HashMap<>();
        types.forEach(t -> {
            Page<Search> searchPage = searchRepo.findByTypeAndKeyword(t, keyword, pageReq);

            Page<SearchDto<?>> searchDtoPage = mapToSearchDtoPage(searchPage, t);
            SearchPageDto searchDto = new SearchPageDto(
                    searchDtoPage.getContent(),
                    PageMetadata.of(searchDtoPage));
            searchDtosMap.put(t, searchDto);
        });
        return searchDtosMap;
    }

    /* #: Helper */
    private Page<SearchDto<?>> mapToSearchDtoPage(Page<Search> searchPage, ResourceType type) {
        final List<UUID> rIds = searchPage.map(Search::getIdFromUri).toList();
        switch (type) {
            case TRACK:
                List<TrackDto> trackDtos = trackService.getTracks(rIds);

                // ## Try to create audio segment 128kbps by refCode if track is not playable
                final Map<UUID, TrackDto> trackDtosMap = trackDtos.stream()
                        .collect(Collectors.toMap(TrackDto::getId, t -> t));
                return searchPage.map(Search::getIdFromUri)
                        .map(trackId -> new SearchDto<>(trackDtosMap.get(trackId)));
            case ARTIST:
                final List<ArtistDto> artistDtos = artistService.getArtists(rIds);
                final Map<UUID, ArtistDto> artistDtosMap = artistDtos.stream()
                        .collect(Collectors.toMap(ArtistDto::getId, a -> a));
                return searchPage.map(Search::getIdFromUri)
                        .map(artistId -> new SearchDto<>(artistDtosMap.get(artistId)));

            default:
                throw CommonException.INTERNAL_SERVER_ERROR.instance();
        }
    }
    /* # Helper */

}
