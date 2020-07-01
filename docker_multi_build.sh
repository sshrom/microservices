#! /bin/bash
set -e

for i in ui post-py comment
    do  echo "docker: building src/$i" 
        cd src/$i
        bash docker_build.sh
        cd -

    done
