#!/bin/bash

REPO=smidu/php7-nginx-alpine-3.12
VERSION=$(git log -1 --pretty=%H)

docker buildx build --platform linux/arm/v7,linux/arm64/v8,linux/amd64 -t $REPO:$VERSION .
# docker buildx build --platform linux/amd64 -t $REPO:$VERSION .
docker push $REPO:$VERSION