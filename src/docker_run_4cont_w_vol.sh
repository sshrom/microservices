#! /bin//bash
# run 4 containers (v 2.0)
docker network create reddit

docker run -d --network=reddit \
--network-alias=post_db \
--network-alias=comment_db \
-v reddit_db:/data/db mongo:latest

docker run -d --network=reddit \
--network-alias=post sshrom/post:2.0

docker run -d --network=reddit \
--network-alias=comment sshrom/comment:2.0

docker run -d --network=reddit \
-p 9292:9292 sshrom/ui:2.0
