#!/bin/bash

# Définition des logins de la base de donnée et du backend
cp .env_local .env

echo "Avant d'installer cette application, veuillez saisir les identifiants et mots de passe de la base de donné."

read -r -s -p "Mot de passe root : " root_password
echo ""
read -r -p "Nom utilisateur : " user_name
read -r -s -p "Mot de passe utilisateur : " user_password
echo ""

sed -i "s/DATABASE_HOSTNAME/db/g" .env
sed -i "s/ROOT_PWD/$root_password/g" .env 
sed -i "s/USER_NAME/$user_name/g" .env
sed -i "s/USER_PWD/$user_password/g" .env

#Build and start app and database
sudo docker compose build
sudo docker compose up -d

# Restore database
echo "Wait for 5 second to finish installation before restore database"
sleep 10
sudo docker exec -i it203-projet-db-1 sh -c 'exec mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"' < ./sql/create.sql;
sudo docker exec -i it203-projet-db-1 sh -c 'exec mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"' < ./sql/triggers.sql;
sudo docker exec -i it203-projet-db-1 sh -c 'exec mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"' < ./sql/insert.sql;
sudo docker exec -i it203-projet-db-1 sh -c 'exec mariadb -uroot -p"$MARIADB_ROOT_PASSWORD"' < ./sql/vues.sql;