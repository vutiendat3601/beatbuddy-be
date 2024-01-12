mv /etc/postgresql/16/main/pg_ident.conf /etc/postgresql/16/main/pg_ident.conf.orig
mv /etc/postgresql/16/main/pg_hba.conf /etc/postgresql/16/main/pg_hba.conf.orig
cp ../auth/db/pg_ident.conf /etc/postgresql/16/main/
cp ../auth/db/pg_hba.conf /etc/postgresql/16/main/
systemctl restart postgresql
sleep 3s

sudo -u vutiendat3601 psql -U postgres -f ../auth/db/init-authdb.sql
