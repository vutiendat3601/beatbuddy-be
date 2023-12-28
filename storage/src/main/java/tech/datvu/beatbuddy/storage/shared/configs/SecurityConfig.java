package tech.datvu.beatbuddy.storage.shared.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.web.SecurityFilterChain;

import tech.datvu.beatbuddy.storage.shared.utils.JwtAuthorityConverter;

@Configuration
@EnableMethodSecurity(jsr250Enabled = true, prePostEnabled = true)
public class SecurityConfig {
    private static final String[] DOC_URLS = { "/swagger*/**", "/v3/api-docs/**" };

    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http, JwtAuthorityConverter jwtAuthorityConverter)
            throws Exception {
        http.authorizeHttpRequests(
                reqs -> reqs
                        .requestMatchers(DOC_URLS).permitAll()
                        .anyRequest().authenticated())
                .oauth2ResourceServer(
                        customizer -> customizer.jwt(jwt -> jwt
                                .jwtAuthenticationConverter(jwtAuthorityConverter)))
                .sessionManagement(ssMgnt -> ssMgnt
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS));
        return http.build();
    }
}
