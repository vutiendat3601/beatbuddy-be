mv /etc/postgresql/16/main/pg_ident.conf /etc/postgresql/16/main/pg_ident.conf.orig
mv /etc/postgresql/16/main/pg_hba.conf /etc/postgresql/16/main/pg_hba.conf.orig
cp ../db/pg_ident.conf /etc/postgresql/16/main/
cp ../db/pg_hba.conf /etc/postgresql/16/main/
systemctl restart postgresql
sleep 3s

sudo -u vutiendat3601 psql -U postgres -f ../db/init-authdb.sql
sudo -u vutiendat3601 psql -U bbauthdb -d bbauthdb -f ../db/initdb.d/20240113_23_51_25.sql
