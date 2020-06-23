#! /bin//bash
# build 4 images: pull mongo, post-py, comment, ui

docker pull mongo:latest
docker build -t sshrom/post:1.0 ./post-py
docker build -t sshrom/comment:1.0 ./comment
docker build -t sshrom/ui:1.0 ./ui
