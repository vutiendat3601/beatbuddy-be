package tech.datvu.beatbuddy.api.search.impl;

import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.SEARCH_ANALYSIS_TXT;
import static tech.datvu.beatbuddy.api.shared.global.GlobalConstant.STORAGE_DIR;

import java.time.LocalDateTime;
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
import tech.datvu.beatbuddy.api.artist.ArtistRepo;
import tech.datvu.beatbuddy.api.artist.models.Artist;
import tech.datvu.beatbuddy.api.artist.models.ArtistMapper;
import tech.datvu.beatbuddy.api.audio.models.Audio.AudioQuality;
import tech.datvu.beatbuddy.api.search.SearchRepo;
import tech.datvu.beatbuddy.api.search.SearchService;
import tech.datvu.beatbuddy.api.search.models.Search;
import tech.datvu.beatbuddy.api.search.models.SearchDto;
import tech.datvu.beatbuddy.api.search.models.SearchPageDto;
import tech.datvu.beatbuddy.api.search.models.SearchQueryRequest;
import tech.datvu.beatbuddy.api.search.models.Search.ResourceType;
import tech.datvu.beatbuddy.api.shared.global.CommonException;
import tech.datvu.beatbuddy.api.shared.models.PageMetadata;
import tech.datvu.beatbuddy.api.shared.utils.FileUtil;
import tech.datvu.beatbuddy.api.shared.utils.PaginationUltil;
import tech.datvu.beatbuddy.api.shared.utils.TextUtil;
import tech.datvu.beatbuddy.api.track.TrackRepo;
import tech.datvu.beatbuddy.api.track.TrackServiceAsync;
import tech.datvu.beatbuddy.api.track.models.Track;
import tech.datvu.beatbuddy.api.track.models.TrackMapper;

@RequiredArgsConstructor
@Service
public class SearchServiceImpl implements SearchService {
    private static final String SEARCH_ANALYSIS_FILE = "%s/%s".formatted(STORAGE_DIR, SEARCH_ANALYSIS_TXT);

    // ## Mappers
    private final TrackMapper trackMapper;
    private final ArtistMapper artistMapper;

    // ## Repos
    private final SearchRepo searchRepo;
    private final TrackRepo trackRepo;
    private final ArtistRepo artistRepo;

    // ## Services
    private final TrackServiceAsync trackServiceAsync;

    @Override
    public Map<ResourceType, SearchPageDto> search(@Valid SearchQueryRequest queryReq) {
        PaginationUltil.checkPageOffset(queryReq.getPage(), queryReq.getSize());
        Pageable pageReq = PageRequest.of(queryReq.getPage(), queryReq.getSize());

        final String keyword = queryReq.getQ() == null ? "" : TextUtil.removeAccents(queryReq.getQ().trim());
        Set<ResourceType> types = queryReq.getTypes();
        final Map<ResourceType, SearchPageDto> searchDtosMap = new HashMap<>();
        String searchInfo = "## timestamp: %s, q: %s\n".formatted(LocalDateTime.now(), queryReq.getQ());
        FileUtil.appendText(searchInfo, SEARCH_ANALYSIS_FILE);
        types.forEach(t -> {
            Page<Search> searchPage = searchRepo.findByTypeAndKeyword(pageReq, t, keyword);
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
                final List<Track> tracks = trackRepo.findAllById(rIds);
                final Map<UUID, Track> tracksMap = tracks.stream().collect(Collectors.toMap(Track::getId, t -> t));

                // ## Try to create audio segment 128kbps by refCode if track is not playable
                trackServiceAsync.createTrackAudioSegmentByRefcode(
                        tracks.stream().filter(t -> !t.isPlayable()).map(t -> t.getId()).toList(),
                        AudioQuality.KBPS128);

                return searchPage.map(Search::getIdFromUri)
                        .map(trackId -> new SearchDto<>(trackMapper.mapToTrackDto(tracksMap.get(trackId))));
            case ARTIST:
                final List<Artist> artists = artistRepo.findAllById(rIds);
                final Map<UUID, Artist> artistsMap = artists.stream().collect(Collectors.toMap(Artist::getId, a -> a));
                return searchPage.map(Search::getIdFromUri)
                        .map(artistId -> new SearchDto<>(artistMapper.mapToArtistDto(artistsMap.get(artistId))));

            default:
                throw CommonException.INTERNAL_SERVER_ERROR.instance();
        }
    }
    /* # Helper */

}
