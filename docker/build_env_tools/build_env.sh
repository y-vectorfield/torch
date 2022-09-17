#!/usr/bin/env bash

compose_path=$1/docker-compose.yml

if [ "${2}" = "-nc" ]; then
    docker-compose -f ${compose_path} build --no-cache && \
    docker-compose -f ${compose_path} up -d
else
    docker-compose -f ${compose_path} build && \
    docker-compose -f ${compose_path} up -d
fi
