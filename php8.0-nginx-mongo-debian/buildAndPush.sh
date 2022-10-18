#!/bin/bash

REPO=smidu/php8.0-nginx-mongo-debian
VERSION=$(git log -1 --pretty=%H)

docker build -t $REPO:$VERSION .
docker push $REPO:$VERSION