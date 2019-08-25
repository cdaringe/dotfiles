#! /usr/bin/env bash

function dkilla () {
  printf "\n==== Docker: Container Purge ====\n"
  printf "Purging $(docker ps -aq | wc -w | xargs) containers\n"
  for hash in $(docker ps -aq); do
    docker rm -f $hash &
  done
  wait
  printf "\nfin.\n"
}
alias docker-cleanup="docker run -d -v /var/run/docker.sock:/var/run/docker.sock:rw -v /var/lib/docker:/var/lib/docker:rw --env KEEP_IMAGES='ubuntu:trusty, ubuntu:latest, node, node:slim' meltwater/docker-cleanup:latest"
alias dcomposeup="docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml up"
alias dcomposedown="docker-compose -f docker-compose.yaml -f docker-compose.dev.yaml down"
alias pdcomposeup="docker-compose -f docker-compose.yaml -f docker-compose.prod.yaml up"
alias pdcomposedown="docker-compose -f docker-compose.yaml -f docker-compose.prod.yaml down"
