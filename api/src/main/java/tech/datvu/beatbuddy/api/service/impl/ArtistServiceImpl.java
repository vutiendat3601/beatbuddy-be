package tech.datvu.beatbuddy.api.service.impl;

import static tech.datvu.beatbuddy.api.entity.Track.TRACK_SORT_FIELDS;

import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.dto.ArtistDto;
import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.entity.Artist;
import tech.datvu.beatbuddy.api.entity.Search;
import tech.datvu.beatbuddy.api.entity.Track;
import tech.datvu.beatbuddy.api.exception.ArtistException;
import tech.datvu.beatbuddy.api.exception.CommonException;
import tech.datvu.beatbuddy.api.exception.GlobalException;
import tech.datvu.beatbuddy.api.mapper.ArtistMapper;
import tech.datvu.beatbuddy.api.model.ResourceType;
import tech.datvu.beatbuddy.api.model.request.ArtistRequest;
import tech.datvu.beatbuddy.api.model.request.PageSortRequest;
import tech.datvu.beatbuddy.api.model.request.PaginationRequest;
import tech.datvu.beatbuddy.api.repository.ArtistRepository;
import tech.datvu.beatbuddy.api.repository.SearchRepository;
import tech.datvu.beatbuddy.api.repository.TrackArtistRepository;
import tech.datvu.beatbuddy.api.repository.TrackRepository;
import tech.datvu.beatbuddy.api.service.ArtistService;
import tech.datvu.beatbuddy.api.service.ArtistServiceAsync;
import tech.datvu.beatbuddy.api.service.FileService;
import tech.datvu.beatbuddy.api.service.TrackService;
import tech.datvu.beatbuddy.api.util.PaginationUtil;
import tech.datvu.beatbuddy.api.util.TextUtil;
import tech.datvu.beatbuddy.api.util.parser.SortParser;

@Service
@RequiredArgsConstructor
public class ArtistServiceImpl implements ArtistService {
    private static final String[] ARTIST_SORT_FIELDS = {
            "id", "realName", "nickName", "birthDate" };
    private final List<String> COUNTRY_CODES = List.of(Locale.getISOCountries());

    // ## Mappers
    private final ArtistMapper artistMapper;
    private final TrackArtistRepository trackArtistRepo;

    // ## Repos
    private final ArtistRepository artistRepo;
    private final TrackRepository trackRepo;
    private final SearchRepository searchRepo;

    // ## Services
    private TrackService trackService;
    private final ArtistServiceAsync artistServiceAsync;
    private final FileService fileService;

    @Autowired
    public void setTrackService(@Lazy TrackService trackService) {
        this.trackService = trackService;
    }

    @Override
    public Page<ArtistDto> getArtists(int page, int size, String q, String sortBy) {
        PaginationUtil.checkPagination(page, size);
        Sort sort = SortParser.parseQueryParam(sortBy, ARTIST_SORT_FIELDS);
        Pageable pageReq = PageRequest.of(page, size, sort);
        q = TextUtil.removeAccents(q);
        Page<Artist> artistPage = artistRepo.findAllByKeyword(pageReq, q);
        Page<ArtistDto> artistDtoPage = artistPage.map(artistMapper::mapToArtistDto);
        return artistDtoPage;
    }

    @Override
    public ArtistDto getArtist(UUID artistId) {
        Artist artist = artistRepo.findPublicById(artistId)
                .orElseThrow(() -> ArtistException.ARTIST_NOT_FOUND.instance());
        ArtistDto artistDto = artistMapper.mapToArtistDto(artist);
        return artistDto;
    }

    @Override
    public List<ArtistDto> getArtists(Iterable<UUID> artistIds) {
        List<Artist> artists = artistRepo.findAllPublicById(artistIds);
        List<ArtistDto> artistDtos = artists.stream()
                .map(artistMapper::mapToArtistDto).toList();
        return artistDtos;
    }

    @Override
    public UUID createArtist(ArtistRequest artistReq) {
        String nationality = artistReq.getNationality();
        if (nationality != null && !COUNTRY_CODES.contains(nationality.toUpperCase())) {
            GlobalException countryNotFound = CommonException.ISO_COUNTRY_CODE_NOT_FOUND.instance();
            countryNotFound.setMessage("nationality isn't found");
            throw countryNotFound;
        }
        Artist artist = artistMapper.mapToArtist(artistReq);

        String avatar = fileService.saveImageFile(artistReq.getThumbnail(), true);
        String bgImg = fileService.saveImageFile(artistReq.getBackgroundImg(), true);
        artist.setThumbnail(avatar);
        artist.setBackgroundImg(bgImg);

        artist = artistRepo.save(artist);
        artistServiceAsync.createArtistSearch(artist.getId());

        return artist.getId();
    }

    @Override
    public Page<TrackDto> getArtistTracks(UUID id, PageSortRequest pageReq) {
        PaginationUtil.checkPagination(pageReq.getPage(), pageReq.getSize());
        Sort sort = SortParser.parseQueryParam(pageReq.getSortBy(), TRACK_SORT_FIELDS);
        Pageable pageable = PageRequest.of(pageReq.getPage(), pageReq.getSize(), sort);
        Page<Track> trackPage = trackRepo.findByArtistId(pageable, id);
        Page<TrackDto> trackDtoPage = trackPage.map(t -> trackService.getTrack(t.getId()));
        return trackDtoPage;
    }

    @Override
    public List<TrackDto> getArtistTopTracks(UUID artistId, Integer top) {
        List<String> trackUris = trackArtistRepo.findAllByArtistId(artistId)
                .stream()
                .map(t -> ResourceType.mapUri(ResourceType.TRACK, t.getTrackId())).toList();

        Sort sortBy = Sort.by(Sort.Direction.DESC, "popularity");
        List<UUID> trackIds = searchRepo.findAllByUriInAndType(
                PageRequest.of(0, top, sortBy),
                trackUris,
                ResourceType.TRACK

        ).stream().map(Search::getIdFromUri).toList();

        List<TrackDto> trackDtos = trackIds.stream()
                .map(trackId -> trackService.getTrack(trackId)).toList();
        return trackDtos;
    }

    @Override
    public Page<ArtistDto> getPopularArtists(PaginationRequest pageReq) {
        PaginationUtil.checkPagination(pageReq.getPage(), pageReq.getSize());
        Sort sortBy = Sort.by(Direction.DESC, "popularity");
        Pageable pageable = PageRequest.of(pageReq.getPage(), pageReq.getSize(), sortBy);
        Page<Search> searchResultArtist = searchRepo.findAllByType(pageable, ResourceType.ARTIST);
        return searchResultArtist.map(s -> getArtist(Search.getIdFromUri(s)));
    }

    @Override
    public void increaseSearchPriority(UUID artistId) {
        artistServiceAsync.increasePopularity(artistId);
    }
}
