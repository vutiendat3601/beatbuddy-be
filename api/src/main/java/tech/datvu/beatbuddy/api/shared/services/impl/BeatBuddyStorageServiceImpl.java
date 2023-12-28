package tech.datvu.beatbuddy.api.shared.services.impl;

import static tech.datvu.beatbuddy.api.shared.configs.SecurityConfig.BEAT_BUDDY_API_REGISTRATION_ID;

import java.time.Instant;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import tech.datvu.beatbuddy.api.shared.services.BeatBuddyStorageService;
import tech.datvu.beatbuddy.api.shared.services.models.FileDto;
import tech.datvu.beatbuddy.api.shared.services.models.FileResponse;
import tech.datvu.beatbuddy.api.shared.utils.OAuth2Client;

@Slf4j
@RequiredArgsConstructor
@Service
public class BeatBuddyStorageServiceImpl implements BeatBuddyStorageService {
    private final RestTemplate restTemplate;

    private final OAuth2Client oAuth2Client;

    private OAuth2AccessToken accToken;

    @Value("${app.service.beatbuddy-storage-url}")
    private String beatBuddyStorageUrl;

    @Override
    public FileDto createFile(String filePath, String path, boolean replaceIfExist) {
        final String CREATE_FILE_API = "%s/v1/storage/files".formatted(beatBuddyStorageUrl);
        HttpHeaders headers = prepareHeader();
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);
        MultiValueMap<String, Object> bodyFormData = new LinkedMultiValueMap<>();
        bodyFormData.add("file", new FileSystemResource(filePath));
        bodyFormData.add("path", path);
        bodyFormData.add("replaceIfExist", replaceIfExist);
        HttpEntity<MultiValueMap<String, Object>> reqEntity = new HttpEntity<>(bodyFormData, headers);

        log.info("Create file with path %s".formatted(path));
        ResponseEntity<FileResponse> respEntity = restTemplate.postForEntity(CREATE_FILE_API, reqEntity,
                FileResponse.class);
        if (respEntity.getStatusCode().is2xxSuccessful()) {
            FileResponse fileResp = respEntity.getBody();
            if (fileResp != null) {
                return fileResp.getData();
            }
        }
        return null;
    }

    /* #: Helpers */
    private HttpHeaders prepareHeader() {
        Instant expAt = null;
        if (accToken == null ||
                ((expAt = accToken.getExpiresAt()) != null
                        && expAt.isBefore(Instant.now()))) {
            accToken = oAuth2Client.retrieveToken(BEAT_BUDDY_API_REGISTRATION_ID);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + accToken.getTokenValue());
        return headers;
    }

    /* # Helpers */
}
