package tech.datvu.beatbuddy.api.search.impl;

import static tech.datvu.beatbuddy.api.shared.utils.TextUtil.removeAccents;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.artist.ArtistService;
import tech.datvu.beatbuddy.api.artist.models.ArtistDto;
import tech.datvu.beatbuddy.api.search.SearchRepo;
import tech.datvu.beatbuddy.api.search.SearchService;
import tech.datvu.beatbuddy.api.search.SearchServiceAsync;
import tech.datvu.beatbuddy.api.search.models.Search;
import tech.datvu.beatbuddy.api.search.models.Search.ResourceType;
import tech.datvu.beatbuddy.api.search.models.SearchDto;
import tech.datvu.beatbuddy.api.search.models.SearchPageDto;
import tech.datvu.beatbuddy.api.search.models.SearchQueryRequest;
import tech.datvu.beatbuddy.api.shared.global.CommonException;
import tech.datvu.beatbuddy.api.shared.models.PageMetadata;
import tech.datvu.beatbuddy.api.shared.utils.PaginationUltil;
import tech.datvu.beatbuddy.api.shared.utils.TextUtil;
import tech.datvu.beatbuddy.api.track.TrackService;
import tech.datvu.beatbuddy.api.track.models.TrackDto;

@RequiredArgsConstructor
@Service
public class SearchServiceImpl implements SearchService {
    // ## Repos
    private final SearchRepo searchRepo;

    // ## Services
    private final TrackService trackService;
    private final ArtistService artistService;
    private final SearchServiceAsync searchServiceAsync;

    @Override
    public Map<ResourceType, SearchPageDto> search(@Valid SearchQueryRequest queryReq) {
        PaginationUltil.checkPageOffset(queryReq.getPage(), queryReq.getSize());
        Pageable pageReq = PageRequest.of(queryReq.getPage(), queryReq.getSize());

        final String keyword = queryReq.getQ() == null ? "" : TextUtil.removeAccents(queryReq.getQ().trim());
        Set<ResourceType> types = queryReq.getTypes();
        final Map<ResourceType, SearchPageDto> searchDtosMap = new HashMap<>();
        types.forEach(t -> {
            Page<Search> searchPage = searchRepo.findByTypeAndKeyword(pageReq, keyword, t);

            // ## Increase priority of search result's elements
            searchServiceAsync.increasePriorityById(searchPage
                    .filter(s -> removeAccents(s.getName()).contains(removeAccents(keyword)))
                    .map(s -> s.getId()).toList());

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
