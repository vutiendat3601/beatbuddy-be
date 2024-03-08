package vn.io.datvutech.beatbuddy.api.model;

import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class KeycloakResourcePermission {
    private String username;

    private Set<String> scopes; 
}
