#!/bin/bash

REPO=smidu/k8s-azurecli-ubuntu-20.04
VERSION=$(git log -1 --pretty=%H)

docker build -t $REPO:$VERSION .
docker push $REPO:$VERSION