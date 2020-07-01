#!/bin/bash
# make docke-machine env instance in gce
set -e

echo "### CREATING DOCKER MACHINE:"
docker-machine create --driver google \
--google-project docker-281019 \
--google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1804-lts \
--google-disk-size 100 \
--google-machine-type n1-standard-1 \
--google-zone europe-west1-b docker-machine-gitlab-ci

# echo "### DISK RESIZING:"
# gcloud compute disks resize $TAG-disk --zone=europe-west1-b --size=100GB


echo "### CREATING FIREWALL-RULES: "
gcloud compute firewall-rules create httphttps \
--allow tcp:80,tcp:443 \
--target-tags=docker-machine \
--description="Allow HTTP HTTPS" \
--direction=INGRESS



