package tech.datvu.beatbuddy.api.shared.utils;

import java.util.UUID;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class UserContext {
    private static ThreadLocal<UUID> userId = new ThreadLocal<>();

    private static ThreadLocal<String> username = new ThreadLocal<>();

    private static ThreadLocal<String> email = new ThreadLocal<>();

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
