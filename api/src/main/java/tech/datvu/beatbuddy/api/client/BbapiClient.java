package tech.datvu.beatbuddy.api.client;

import static tech.datvu.beatbuddy.api.global.GlobalConstant.BEATBUDDY;

import org.keycloak.admin.client.Keycloak;
import org.keycloak.representations.idm.authorization.ResourceRepresentation;
import org.keycloak.representations.idm.authorization.ScopeRepresentation;
import org.springframework.stereotype.Component;

import jakarta.ws.rs.core.Response;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Component
public class BbapiClient {
    public static final String ID = "e39e0e92-739a-46bd-a918-032fc4f7b24b";
    public static final ScopeRepresentation POST_SCOPE = new ScopeRepresentation("POST");
    public static final ScopeRepresentation GET_SCOPE = new ScopeRepresentation("GET");
    public static final ScopeRepresentation PUT_SCOPE = new ScopeRepresentation("PUT");
    public static final ScopeRepresentation DELETE_SCOPE = new ScopeRepresentation("DELETE");

    private final Keycloak bbapi;

    public ResourceRepresentation createResource(ResourceRepresentation resource) {
        Response resp = bbapi.realm(BEATBUDDY).clients().get(ID).authorization()
                .resources()
                .create(resource);
        int status = resp.getStatus();
        if (status >= 200 && status < 300) {
            log.info("Created resouce: " + resource.getName());
            if (resp.hasEntity()) {
                return resp.readEntity(ResourceRepresentation.class);
            }
        } else {
            log.error(resp.getEntity() + "");
        }
        return null;
    }
}
