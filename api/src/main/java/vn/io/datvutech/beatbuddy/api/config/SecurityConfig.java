package vn.io.datvutech.beatbuddy.api.config;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.keycloak.adapters.authorization.integration.jakarta.ServletPolicyEnforcerFilter;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.keycloak.representations.adapters.config.PolicyEnforcerConfig;
import org.keycloak.util.JsonSerialization;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;
import org.springframework.security.oauth2.server.resource.web.authentication.BearerTokenAuthenticationFilter;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;

import io.swagger.v3.oas.annotations.enums.SecuritySchemeIn;
import io.swagger.v3.oas.annotations.enums.SecuritySchemeType;
import io.swagger.v3.oas.annotations.security.SecurityScheme;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import vn.io.datvutech.beatbuddy.api.filter.JwtUserContextFilter;

@Slf4j
@RequiredArgsConstructor
@Configuration
@SecurityScheme(name = "keycloak", openIdConnectUrl = "https://bbauth.datvu.tech/realms/beatbuddy/.well-known/openid-configuration", scheme = "bearer", type = SecuritySchemeType.OPENIDCONNECT, in = SecuritySchemeIn.HEADER)
@EnableMethodSecurity(jsr250Enabled = true, prePostEnabled = true)
public class SecurityConfig {

    private final Environment env;

    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http)
            throws Exception {
        http
                .oauth2ResourceServer(
                        oauth2 -> oauth2.jwt(
                                Customizer.withDefaults())

                )
                .addFilterAfter(
                        createPolicyEnforcerFilter(),
                        BearerTokenAuthenticationFilter.class

                )
                .addFilterAfter(
                        new JwtUserContextFilter(),
                        ServletPolicyEnforcerFilter.class

                )
                .csrf(csrf -> Customizer.withDefaults())
                .cors(cors -> cors.configurationSource(req -> {
                    CorsConfiguration config = new CorsConfiguration();
                    config.setAllowedOrigins(List.of("*"));
                    config.setAllowedMethods(Collections.singletonList("*"));
                    config.setAllowedHeaders(Collections.singletonList("*"));
                    config.setMaxAge(3600L);
                    return config;
                }))
                .sessionManagement(ssMgnt -> ssMgnt
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS)

                );
        return http.build();
    }

    private ServletPolicyEnforcerFilter createPolicyEnforcerFilter() {
        try {
            final PolicyEnforcerConfig config = JsonSerialization.readValue(
                    getClass().getResourceAsStream("/policy-enforcer.json"),
                    PolicyEnforcerConfig.class);
            Optional.ofNullable(env.getProperty("policy-enforcer.auth-server-url"))
                    .ifPresent((authServerUrl) -> {
                        config.setAuthServerUrl(authServerUrl);
                        log.info("Auth server url: %s".formatted(authServerUrl));
                    });
            return new ServletPolicyEnforcerFilter(request -> config);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Bean
    JwtAuthenticationConverter jwtAuthenticationConverter() {
        JwtAuthenticationConverter jwtAuthenticationConverter = new JwtAuthenticationConverter();
        JwtGrantedAuthoritiesConverter jwtGrantedAuthoritiesConverter = new JwtGrantedAuthoritiesConverter();
        jwtGrantedAuthoritiesConverter.setAuthorityPrefix("");
        jwtGrantedAuthoritiesConverter.setAuthoritiesClaimName("roles");
        jwtAuthenticationConverter.setJwtGrantedAuthoritiesConverter(jwtGrantedAuthoritiesConverter);
        return jwtAuthenticationConverter;
    }

    @Bean
    Keycloak keycloak(
            @Value("${bbapi.server-url}") String serverUrl,
            @Value("${bbapi.realm}") String realm,
            @Value("${bbapi.client-id}") String clientId,
            @Value("${bbapi.client-secret}") String secret,
            @Value("${bbapi.grant-type}") String grantType

    ) {
        return KeycloakBuilder.builder()
                .serverUrl(serverUrl)
                .realm(realm)
                .clientId(clientId)
                .clientSecret(secret)
                .grantType(grantType)
                .build();
    }
}
