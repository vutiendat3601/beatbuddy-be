export PGPASSWORD=beatbuddyauth
pg_dump -c -w beatbuddyauth -U beatbuddyauth > /backup/`date +%Y%m%d'_'%H_%M_%S`.sql
