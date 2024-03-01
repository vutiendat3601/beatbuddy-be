package tech.datvu.beatbuddy.api.util;

import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;

import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@NoArgsConstructor
@Data
public class UserContext {
    public static String ANONYMOUS = "_";

    public static String BOT = "bot";

    private static AtomicReference<Jwt> jwt = new AtomicReference<>();

    private static AtomicReference<UUID> userId = new AtomicReference<>();

    private static AtomicReference<String> username = new AtomicReference<>();

    private static AtomicReference<String> email = new AtomicReference<>();

    public static void setJwt(Jwt jwt) {
        UserContext.jwt.set(jwt);
    }

    public static String getClaimAsString(String claim) {
        Jwt jwtRef = jwt.get();
        if (jwtRef != null) {
            return jwtRef.getClaimAsString(claim);
        }
        return null;
    }

    public static Jwt getJwt() {
        return jwt.get();
    }

    public static void setUserId(UUID userId) {
        UserContext.userId.set(userId);
    }

    public static UUID getUserId() {
        return userId.get();
    }

    public static void setUsername(String username) {
        UserContext.username.set(username);
    }

    public static String getUsername() {
        return username.get();
    }

    public static void setEmail(String email) {
        UserContext.username.set(email);
    }

    public static String getEmail() {
        return email.get();
    }
}
