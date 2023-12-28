package tech.datvu.beatbuddy.api.shared.utils;

import static tech.datvu.beatbuddy.api.shared.configs.SecurityConfig.BEAT_BUDDY_API_REGISTRATION_ID;

import java.util.Objects;

import org.springframework.security.oauth2.client.AuthorizedClientServiceOAuth2AuthorizedClientManager;
import org.springframework.security.oauth2.client.OAuth2AuthorizeRequest;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClient;
import org.springframework.security.oauth2.core.OAuth2AccessToken;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Component
public class OAuth2Client {
    private final AuthorizedClientServiceOAuth2AuthorizedClientManager authorizedClientServiceAndManager;

    public OAuth2AccessToken retrieveToken(String clientRegistrationId) {
        OAuth2AuthorizeRequest authorizeRequest = OAuth2AuthorizeRequest
                .withClientRegistrationId(BEAT_BUDDY_API_REGISTRATION_ID)
                .principal(BEAT_BUDDY_API_REGISTRATION_ID)
                .build();
        OAuth2AuthorizedClient authorizedClient = authorizedClientServiceAndManager.authorize(authorizeRequest);
        OAuth2AccessToken accessToken = Objects.requireNonNull(authorizedClient).getAccessToken();
        return accessToken;
    }
}
