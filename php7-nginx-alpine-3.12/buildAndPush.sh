#!/bin/bash

REPO=smidu/php7-nginx-alpine-3.12
VERSION=$(git log -1 --pretty=%H)

docker build -t $REPO:$VERSION .
docker push $REPO:$VERSION