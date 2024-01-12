mv /etc/postgresql/16/main/pg_ident.conf /etc/postgresql/16/main/pg_ident.conf.orig
mv /etc/postgresql/16/main/pg_hba.conf /etc/postgresql/16/main/pg_hba.conf.orig
cp ../auth/db/pg_ident.conf /etc/postgresql/16/main/
cp ../auth/db/pg_hba.conf /etc/postgresql/16/main/

psql -U postgres -a -f ../auth/db/init-authdb.sql
