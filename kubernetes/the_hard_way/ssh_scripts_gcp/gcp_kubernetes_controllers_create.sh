#!/bin/bash
# # Make sure that default region and zone have been done previously
# # Setting a default compute region and compute zone:
# gcloud config set compute/region europe-west1
# gcloud config set compute/zone europe-west1-c

for i in 0 1 2; do
  gcloud compute instances create controller-${i} \
    --async \
    --boot-disk-size 200GB \
    --can-ip-forward \
    --image-family ubuntu-2004-lts \
    --image-project ubuntu-os-cloud \
    --machine-type e2-standard-2 \
    --private-network-ip 10.240.0.1${i} \
    --scopes compute-rw,storage-ro,service-management,service-control,logging-write,monitoring \
    --subnet kubernetes \
    --tags kubernetes-the-hard-way,controller

done

gcloud compute instances list --filter="tags.items=kubernetes-the-hard-way"

