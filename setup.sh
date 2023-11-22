#!/bin/sh

# Check if docker is available.
if ! (docker ps >/dev/null 2>&1) then
	echo "Docker is not running. Maybe you need to run as root?"
	exit
fi

# Check if the initdb script has been created.
if [ ! -f ./initdb/initdb.sql ]; then
	mkdir -p ./guacamole/initdb
	chmod -R +x ./guacamole/initdb

	docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgresql > ./guacamole/initdb/initdb.sql
fi

# Check if a password has already been set.
if ! grep -qF "POSTGRES_PASSWORD=" ./guacamole/.env; then
	echo "POSTGRES_PASSWORD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 12; echo)" >> ./guacamole/.env
fi

docker compose -f ./guacamole/docker-compose.yml up -d

echo
echo "Guacamole is running on: http://localhost:8080/guacamole"
echo
echo "The default user is:"
echo
echo "    username: guacadmin"
echo "    password: guacadmin"
echo