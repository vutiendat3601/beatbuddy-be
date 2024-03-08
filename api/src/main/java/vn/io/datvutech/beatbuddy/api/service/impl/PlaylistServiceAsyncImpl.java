package vn.io.datvutech.beatbuddy.api.service.impl;

import static vn.io.datvutech.beatbuddy.api.client.BbapiClient.DELETE_SCOPE;
import static vn.io.datvutech.beatbuddy.api.client.BbapiClient.GET_SCOPE;
import static vn.io.datvutech.beatbuddy.api.client.BbapiClient.PUT_SCOPE;
import static vn.io.datvutech.beatbuddy.api.global.GlobalConstant.BB;
import static vn.io.datvutech.beatbuddy.api.global.GlobalConstant.PLAYLIST;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.keycloak.representations.idm.authorization.ResourceRepresentation;
import org.keycloak.representations.idm.authorization.ScopeRepresentation;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import lombok.RequiredArgsConstructor;
import vn.io.datvutech.beatbuddy.api.client.BbapiClient;
import vn.io.datvutech.beatbuddy.api.entity.Playlist;
import vn.io.datvutech.beatbuddy.api.model.KeycloakResourcePermission;
import vn.io.datvutech.beatbuddy.api.service.PlaylistServiceAsync;
import vn.io.datvutech.beatbuddy.api.util.ObjectMapperUtil;
import vn.io.datvutech.beatbuddy.api.util.UserContext;

@RequiredArgsConstructor
@Service
public class PlaylistServiceAsyncImpl implements PlaylistServiceAsync {
    private final BbapiClient bbapi;
    private final RestTemplate restTemplate;
    private final String API_RESOURCE_PERMISSION_UPDATE = "https://bbauth.datvu.tech/realms/beatbuddy/account/resources/%s/permissions";
    private final Set<ScopeRepresentation> OWNER_SCOPES = new HashSet<>(List.of(GET_SCOPE, PUT_SCOPE, DELETE_SCOPE));
    private final Set<String> OWNER_SCOPE_VALUES = new HashSet<>(
            List.of(GET_SCOPE.getName(), PUT_SCOPE.getName(), DELETE_SCOPE.getName()));

    @Override
    public void createPlaylist(Playlist playlist) {
        String name = "%s:%s:%s".formatted(BB, PLAYLIST, playlist.getId());

        String owner = UserContext.getUsername();
        String uri = "/v1/user/%s/playlists/%s".formatted(owner, playlist.getId());
        ResourceRepresentation resource = new ResourceRepresentation(name, OWNER_SCOPES, uri, name);
        resource.setOwner(owner);
        resource.setDisplayName(playlist.getName());
        resource.setOwnerManagedAccess(true);
        resource = bbapi.createResource(resource);
        List<KeycloakResourcePermission> resourcePermissions = List
                .of(new KeycloakResourcePermission(UserContext.getUsername(), OWNER_SCOPE_VALUES));
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(UserContext.getJwt().getTokenValue());
        HttpEntity<String> reqEntity = new HttpEntity<>(ObjectMapperUtil.writeValueAsString(resourcePermissions),
                headers);
        restTemplate.exchange(
                API_RESOURCE_PERMISSION_UPDATE.formatted(resource.getId()),
                HttpMethod.PUT,
                reqEntity,
                String.class

        );
        System.out.println();
    }

}