#! /bin/bash
# run 4 containers (v 3.0)

# docker network create back_net --subnet=10.0.2.0/24
# docker network create front_net --subnet=10.0.1.0/24

# docker network connect front_net post
# docker network connect front_net comment

docker run -d --network=back_net \
--name mongo_db \
--network-alias=post_db \
--network-alias=comment_db \
-v reddit_db:/data/db \
mongo:latest

docker run -d --network=back_net \
--network-alias=post --name post sshrom/post:2.0

docker run -d --network=back_net \
--network-alias=comment --name comment sshrom/comment:2.0

docker run -d --network=front_net \
-p 9292:9292 \
--name ui sshrom/ui:2.0

# docker network connect front_net post
# docker network connect front_net comment
#