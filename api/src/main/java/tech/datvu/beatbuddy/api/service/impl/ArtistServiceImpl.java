package tech.datvu.beatbuddy.api.service.impl;

import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.dto.ArtistDto;
import tech.datvu.beatbuddy.api.dto.TrackDto;
import tech.datvu.beatbuddy.api.entity.Artist;
import tech.datvu.beatbuddy.api.entity.Search;
import tech.datvu.beatbuddy.api.entity.Track;
import tech.datvu.beatbuddy.api.entity.Search.ResourceType;
import tech.datvu.beatbuddy.api.exception.ArtistException;
import tech.datvu.beatbuddy.api.exception.CommonException;
import tech.datvu.beatbuddy.api.exception.GlobalException;
import tech.datvu.beatbuddy.api.mapper.ArtistMapper;
import tech.datvu.beatbuddy.api.mapper.TrackMapper;
import tech.datvu.beatbuddy.api.model.request.ArtistRequest;
import tech.datvu.beatbuddy.api.model.request.SearchRequest;
import tech.datvu.beatbuddy.api.repository.ArtistRepository;
import tech.datvu.beatbuddy.api.repository.TrackRepository;
import tech.datvu.beatbuddy.api.service.ArtistService;
import tech.datvu.beatbuddy.api.service.FileService;
import tech.datvu.beatbuddy.api.service.SearchServiceAsync;
import tech.datvu.beatbuddy.api.util.PaginationUltil;
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
    private final TrackMapper trackMapper;

    // ## Repos
    private final ArtistRepository artistRepo;
    private final TrackRepository trackRepo;

    // ## Services
    private final SearchServiceAsync searchServiceAsync;
    private final FileService fileService;

    @Override
    public Page<ArtistDto> getArtists(int page, int size, String q, String sortBy) {
        PaginationUltil.checkPageOffset(page, size);
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
        List<String> searchUris = List.of(Search.mapUri(ResourceType.ARTIST, artistId));
        searchServiceAsync.increasePriorityByUri(searchUris);
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
        searchServiceAsync.createSearch(
                new SearchRequest(
                        artist.getName(),
                        "",
                        artist.getThumbnail(),
                        ResourceType.ARTIST,
                        artist.getId()));

        return artist.getId();
    }

    @Override
    public Page<TrackDto> getArtistTracks(UUID id, int page, int size) {
        PaginationUltil.checkPageOffset(page, size);
        Pageable pageReq = PageRequest.of(page, size);
        Page<Track> trackPage = trackRepo.findByArtistId(id, pageReq);
        Page<TrackDto> trackDtoPage = trackPage.map(
                t -> {
                    TrackDto trackDto = trackMapper.mapToTrackDto(t);
                    List<Artist> artists = artistRepo.findByTrackId(t.getId());
                    List<ArtistDto> artistDtos = artists.stream().map(artistMapper::mapToArtistDto).toList();
                    trackDto.setArtists(artistDtos);
                    return trackDto;
                });
        return trackDtoPage;
    }
}
