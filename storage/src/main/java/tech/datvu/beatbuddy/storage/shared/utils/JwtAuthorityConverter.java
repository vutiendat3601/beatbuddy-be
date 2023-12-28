package tech.datvu.beatbuddy.storage.shared.utils;

import java.util.Collection;
import java.util.List;
import java.util.UUID;
import java.util.stream.Stream;

import org.springframework.core.convert.converter.Converter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.stereotype.Component;

@Component
public class JwtAuthorityConverter extends JwtAuthenticationConverter {
    public JwtAuthorityConverter() {
        Converter<Jwt, Collection<GrantedAuthority>> converter = jwt -> {
            // ## Save UserContext
            UserContext.setEmail(jwt.getClaimAsString("email"));
            UserContext.setUserId(UUID.fromString(jwt.getSubject()));
            UserContext.setUsername(jwt.getClaimAsString("username"));

            Stream<String> roles = jwt.hasClaim("roles")
                    ? jwt.getClaimAsStringList("roles").stream()
                    : Stream.empty();
            Stream<String> permissions = jwt.hasClaim("permissions")
                    ? jwt.getClaimAsStringList("permissions").stream()
                    : Stream.empty();

            // ## Convert authority
            List<String> authorities = Stream.concat(roles.map(r -> "ROLE_" + r), permissions).toList();
            return AuthorityUtils.createAuthorityList(authorities);
        };
        setJwtGrantedAuthoritiesConverter(converter);
    }
}
