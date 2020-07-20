#!/bin/bash
# create docke-machine env instance in gce

# export GOOGLE_PROJECT=<gcp_proj_name>
# set -e


echo "### CREATING DOCKER MACHINE:"
docker-machine create --driver google \
--google-project docker-281019 \
--google-machine-image https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/family/ubuntu-1804-lts \
--google-disk-size 10 \
--google-machine-type n1-standard-1 \
--google-zone europe-west1-b docker-mon2

# eval $(docker-machine env docker-mon)
# docker-machine ip docker-mon

echo "### CREATING FIREWALL-RULES:"
gcloud compute firewall-rules create prometheus-default --allow tcp:9090
gcloud compute firewall-rules create puma-default --allow tcp:9292


gcloud compute firewall-rules create httphttps \
--allow tcp:80,tcp:8080,tcp:443 \
--target-tags=docker-machine \
--description="Allow HTTP HTTPS" \
--direction=INGRESS

gcloud compute firewall-rules create grafana3000 \
--allow tcp:3000 \
--target-tags=docker-machine \
--description="Allow 3000 Grafana" \
--direction=INGRESS

gcloud compute firewall-rules create node-exp-9100 \
--allow tcp:9100 \
--target-tags=docker-machine \
--description="Allow 9100 NodeExporter" \
--direction=INGRESS


