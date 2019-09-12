#!/bin/bash

COMPOSE="/usr/local/bin/docker-compose --no-ansi"

cd /docker-wordpress
$COMPOSE run --no-deps certbot1 renew --dry-run && $COMPOSE run --no-deps certbot2 renew --dry-run && $COMPOSE kill -s SIGHUP nginx