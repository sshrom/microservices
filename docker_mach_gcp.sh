#!/bin/bash
set -e

docker-machine create --driver google \
--google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1604-lts \
--google-machine-type f1-micro \
--google-zone europe-west1-b docker-host
