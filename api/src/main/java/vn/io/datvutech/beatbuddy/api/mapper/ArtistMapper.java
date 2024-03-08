package vn.io.datvutech.beatbuddy.api.mapper;

import org.springframework.stereotype.Component;

import vn.io.datvutech.beatbuddy.api.dto.ArtistDto;
import vn.io.datvutech.beatbuddy.api.entity.Artist;
import vn.io.datvutech.beatbuddy.api.model.request.ArtistRequest;

@Component
public class ArtistMapper {
    public Artist mapToArtist(ArtistRequest artistReq) {
        if (artistReq != null) {
            String nationality = artistReq.getNationality();
            nationality = nationality == null ? nationality : nationality.toLowerCase();
            return Artist.builder()
                    .isVerified(artistReq.getIsVerified())
                    .isPublic(artistReq.getIsPublic())
                    .name(artistReq.getName())
                    .realName(artistReq.getRealName())
                    .birthDate(artistReq.getBirthDate())
                    .description(artistReq.getDescription())
                    .nationality(nationality)
                    .biography(artistReq.getBiography())
                    .build();
        }
        return null;
    }

    public ArtistDto mapToArtistDto(Artist artist) {
        return artist == null
                ? null
                : ArtistDto.builder()
                        .id(artist.getId())
                        .accountId(artist.getAccountId())
                        .refCode(artist.getRefCode())
                        .realName(artist.getRealName())
                        .name(artist.getName())
                        .realName(artist.getRealName())
                        .isVerified(artist.getIsVerified())
                        .isPublic(artist.isPublic())
                        .birthDate(artist.getBirthDate())
                        .description(artist.getDescription())
                        .nationality(artist.getNationality())
                        .biography(artist.getBiography())
                        .thumbnail(artist.getThumbnail())
                        .backgroundImg(artist.getBackgroundImg())
                        .build();
    }
}
