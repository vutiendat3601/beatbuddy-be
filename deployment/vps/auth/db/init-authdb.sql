CREATE DATABASE beatbuddyauthdb;
CREATE USER beatbuddyauthdb WITH PASSWORD 'beatbuddyauthdb';
GRANT ALL PRIVILEGES ON DATABASE beatbuddyauthdb TO beatbuddyauthdb;
ALTER USER beatbuddyauthdb WITH SUPERUSER;