#!/bin/bash

# environment variable definition
cp .env_local .env

sed -i "s/DATABASE_HOSTNAME/localhost/g" .env
sed -i "s/ROOT_PWD/root/g" .env 
sed -i "s/USER_NAME/dev/g" .env
sed -i "s/USER_PWD/dev/g" .env

cp .env source/backend/.env

# Build and start database
sudo docker compose build db
sudo docker compose up -d db adminer

# Restore database
echo "Wait for 5 second to finish installation before restore database"
sleep 5
sudo docker exec -i it203-projet-db-1 sh -c 'exec mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"' < ./sql/create.sql;
sudo docker exec -i it203-projet-db-1 sh -c 'exec mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"' < ./sql/insert.sql;

# Start interface
cd source/frontend && npm i && npm run serve & 
cd source/backend && npm i && npm run dev & cd .