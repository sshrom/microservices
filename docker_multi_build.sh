#! /bin/bash
set -e

export USER_NAME=sshrom
for i in ui post-py comment
    do  cd src/$i
        chmod ug+x docker_build.sh
        bash docker_build.sh
        cd -

    done
