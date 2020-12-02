#!/usr/bin/bash

set -e

# most of this wrapping should disappear once podman-compose reach maturity

if ! test -f secret_env; then
  echo "No file secret_env, please generate one"
  exit 1
else
  source secret_env
fi


pod_id_file=pod_id.txt
if ! podman pod exists elefant; then
  rm $pod_id_file
  podman pod create -n elefant --pod-id-file $pod_id_file -p 8000
fi
pod_id=$(cat $pod_id_file)
echo "Using pod $pod_id"

if podman pod top elefant | grep -q mysql; then
  echo "Mariadb already running"
else
  mariadb_id=$(podman run --pod-id-file $pod_id_file -d -v "./mariadb_data:/var/lib/mysql" --env-file <(cat secret_env | awk '{print $2}') docker.io/mariadb:10)
  echo "Mariadb is running with container id $mariadb_id"
  sleep 5
  if ! podman ps | grep -q $(echo $mariadb_id | cut -c1-6); then
    echo $mariadb_id crashed quickly after boot
    exit 1
  fi
fi

sed "s/__MYSQL_PASSWORD__/$MYSQL_PASSWORD/;s/__MYSQL_USER__/$MYSQL_USER/;s/__MYSQL_DATABASE__/$MYSQL_DATABASE/;s/__SYMFONY_SECRET__/$SYMFONY_SECRET/;s/__ADMIN_USER__/$ADMIN_USER/;s/__ADMIN_PASSWORD__/$ADMIN_PASSWORD/" parameters.yml.tpl > parameters.yml

image_id=$(podman build -q .)
echo "Will run $image_id"
container_id=$(podman run --rm --pod-id-file $pod_id_file -d $image_id)

echo "Will now watch logs from $container_id"
podman logs -f $container_id
