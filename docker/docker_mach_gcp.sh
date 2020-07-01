#!/bin/bash
# make docke-machine env instance in gce
set -e

docker-machine create --driver google \
--google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1804-lts \
--google-machine-type n1-standard-1 \
--google-zone europe-west1-b docker-host
