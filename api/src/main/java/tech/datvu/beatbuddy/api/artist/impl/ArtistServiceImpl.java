package tech.datvu.beatbuddy.api.artist.impl;

import java.util.List;
import java.util.Locale;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import tech.datvu.beatbuddy.api.artist.ArtistException;
import tech.datvu.beatbuddy.api.artist.ArtistRepo;
import tech.datvu.beatbuddy.api.artist.ArtistService;
import tech.datvu.beatbuddy.api.artist.models.Artist;
import tech.datvu.beatbuddy.api.artist.models.ArtistDto;
import tech.datvu.beatbuddy.api.artist.models.ArtistMapper;
import tech.datvu.beatbuddy.api.artist.models.ArtistRequest;
import tech.datvu.beatbuddy.api.file.FileService;
import tech.datvu.beatbuddy.api.search.SearchServiceAsync;
import tech.datvu.beatbuddy.api.search.models.Search;
import tech.datvu.beatbuddy.api.search.models.SearchRequest;
import tech.datvu.beatbuddy.api.search.models.Search.ResourceType;
import tech.datvu.beatbuddy.api.shared.global.CommonException;
import tech.datvu.beatbuddy.api.shared.global.GlobalException;
import tech.datvu.beatbuddy.api.shared.utils.PaginationUltil;
import tech.datvu.beatbuddy.api.shared.utils.parser.SortParser;

@Service
@RequiredArgsConstructor
public class ArtistServiceImpl implements ArtistService {
    private static final String[] ARTIST_SORT_FIELDS = {
            "id", "realName", "nickName", "birthDate" };
    private final List<String> COUNTRY_CODES = List.of(Locale.getISOCountries());

    // ## Mappers
    private final ArtistMapper artistMapper;

    // ## Repos
    private final ArtistRepo artistRepo;

    // ## Services
    private final SearchServiceAsync searchServiceAsync;
    private final FileService fileService;

    @Override
    public Page<ArtistDto> getArtists(int page, int size, String sortBy) {
        PaginationUltil.checkPageOffset(page, size);
        Sort sort = SortParser.parseQueryParam(sortBy, ARTIST_SORT_FIELDS);
        Pageable pageReq = PageRequest.of(page, size, sort);
        Page<Artist> artistPage = artistRepo.findAll(pageReq);
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
        List<Artist> artists = artistRepo.findPublicById(artistIds);
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
}
