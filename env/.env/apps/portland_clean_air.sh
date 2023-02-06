#!/usr/bin/env bash

# devtime only secret :) nice try suckas.
# see secrets.sh (untracked) for alt env values
export PCA_GQL_ADMIN_SECRET=airman
export HASURA_GRAPHQL_ADMIN_SECRET="$PCA_GQL_ADMIN_SECRET"
