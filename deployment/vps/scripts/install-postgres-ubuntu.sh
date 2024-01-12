apt update -y
apt install -y gnupg2 wget vim

sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg

apt update -y

apt install -y postgresql-16 postgresql-contrib-16

mv /etc/postgresql/16/main/pg_ident.conf /etc/postgresql/16/main/pg_ident.conf.orig
mv /etc/postgresql/16/main/pg_hba.conf /etc/postgresql/16/main/pg_hba.conf.orig
cp ../auth/db/pg_ident.conf /etc/postgresql/16/main/
cp ../auth/db/pg_ident.conf /etc/postgresql/16/main/

systemctl start postgresql
systemctl enable postgresql
