apt update -y
apt upgrade -y
apt install -y unzip
curl -L -o keycloak-23.0.4.zip https://github.com/keycloak/keycloak/releases/download/23.0.4/keycloak-23.0.4.zip
unzip keycloak-23.0.4.zip
mv keycloak-23.0.4 /opt/keycloak
rm -fr keycloak-23.0.4.zip keycloak-23.0.4
mv /opt/keycloak/conf/keycloak.conf /opt/keycloak/conf/keycloak.conf.orig
cp ../auth/keycloak.conf /opt/keycloak/conf/
cp ../auth/kc.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable kc
systemctl start kc
