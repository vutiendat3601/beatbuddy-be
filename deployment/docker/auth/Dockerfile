FROM quay.io/keycloak/keycloak:23.0.4 as layer01
USER root
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres

WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:23.0.4 as layer02
USER root
COPY --from=layer01 /opt/keycloak/ /opt/keycloak/
RUN mkdir -p /etc/tls/
RUN chmod -R 764 /etc/tls/

ENV KC_DB=postgres
ENV KC_DB_SCHEMA=public
ENV KC_DB_URL=jdbc:postgresql://authdb:5432/beatbuddyauthdb
ENV KC_DB_USERNAME=beatbuddyauthdb
ENV KC_DB_PASSWORD=beatbuddyauthdb
ENV KC_HOSTNAME_URL=http://localhost
ENV KC_HOSTNAME_ADMIN_URL=http://localhost
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true
ENV KC_HTTP_PORT=8090

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]