package tech.datvu.beatbuddy.api.artist.models;

import org.springframework.stereotype.Component;

@Component
public class ArtistMapper {
    public Artist mapToArtist(ArtistRequest artistReq) {
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

    public ArtistDto mapToArtistDto(Artist artist) {
        return ArtistDto.builder()
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
