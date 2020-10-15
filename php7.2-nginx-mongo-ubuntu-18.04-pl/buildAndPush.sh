#!/bin/bash

REPO=smidu/php7.2-nginx-mongo-ubuntu-18.04-pl
VERSION=$(git log -1 --pretty=%H)

docker build -t $REPO:$VERSION .
docker push $REPO:$VERSION