package tech.datvu.beatbuddy.api.shared.configs;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.client.AuthorizedClientServiceOAuth2AuthorizedClientManager;
import org.springframework.security.oauth2.client.InMemoryOAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientProvider;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientProviderBuilder;
import org.springframework.security.oauth2.client.OAuth2AuthorizedClientService;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.web.SecurityFilterChain;

import tech.datvu.beatbuddy.api.shared.utils.JwtAuthorityConverter;

@Configuration
@EnableMethodSecurity(jsr250Enabled = true, prePostEnabled = true)
public class SecurityConfig {
    private static final String[] DOC_URLS = { "/swagger*/**", "/v3/api-docs/**" };
    private static final String[] PUBLIC_RESOURCE_URLS = { "/v1/artists" };
    public static final String BEAT_BUDDY_API_REGISTRATION_ID = "beatbuddyapi";

    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http, JwtAuthorityConverter jwtAuthorityConverter)
            throws Exception {
        http.authorizeHttpRequests(
                reqs -> reqs
                        .requestMatchers(DOC_URLS).permitAll()
                        .requestMatchers(HttpMethod.GET, PUBLIC_RESOURCE_URLS).permitAll()
                        .requestMatchers(HttpMethod.GET, "/v1/tracks").permitAll()
                        .anyRequest().authenticated())
                .oauth2ResourceServer(
                        customizer -> customizer.jwt(jwt -> jwt
                                .jwtAuthenticationConverter(jwtAuthorityConverter)))
                .sessionManagement(ssMgnt -> ssMgnt
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS));
        return http.build();
    }

    @Bean
    ClientRegistration beatbuddyapiClientRegistration(
            @Value("${spring.security.oauth2.client.provider.beatbuddyapi.token-uri}") String tokenUri,
            @Value("${spring.security.oauth2.client.registration.beatbuddyapi.client-id}") String clientId,
            @Value("${spring.security.oauth2.client.registration.beatbuddyapi.client-secret}") String clientSecret,
            @Value("${spring.security.oauth2.client.registration.beatbuddyapi.scope}") String scope,
            @Value("${spring.security.oauth2.client.registration.beatbuddyapi.authorization-grant-type}") String authorizationGrantType) {
        return ClientRegistration
                .withRegistrationId(BEAT_BUDDY_API_REGISTRATION_ID)
                .tokenUri(tokenUri)
                .clientId(clientId)
                .clientSecret(clientSecret)
                .scope(scope)
                .authorizationGrantType(new AuthorizationGrantType(authorizationGrantType))
                .build();
    }

    @Bean
    ClientRegistrationRepository clientRegistrationRepository(ClientRegistration oktaClientRegistration) {
        return new InMemoryClientRegistrationRepository(oktaClientRegistration);
    }

    @Bean
    OAuth2AuthorizedClientService auth2AuthorizedClientService(
            ClientRegistrationRepository clientRegistrationRepository) {
        return new InMemoryOAuth2AuthorizedClientService(clientRegistrationRepository);
    }

    @Bean
    AuthorizedClientServiceOAuth2AuthorizedClientManager authorizedClientServiceAndManager(
            ClientRegistrationRepository clientRegistrationRepository,
            OAuth2AuthorizedClientService authorizedClientService) {
        OAuth2AuthorizedClientProvider authorizedClientProvider = OAuth2AuthorizedClientProviderBuilder.builder()
                .clientCredentials()
                .build();
        AuthorizedClientServiceOAuth2AuthorizedClientManager authorizedClientManager = new AuthorizedClientServiceOAuth2AuthorizedClientManager(
                clientRegistrationRepository, authorizedClientService);
        authorizedClientManager.setAuthorizedClientProvider(authorizedClientProvider);
        return authorizedClientManager;
    }
}
