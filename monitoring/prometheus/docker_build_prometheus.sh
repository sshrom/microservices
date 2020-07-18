#!/bin/bash
# building docke container with prometheus

# set -e

export USER_NAME=sshrom # - логин на Docker Hub

docker build -t $USER_NAME/prometheus .
