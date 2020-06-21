#!/bin/bash
set -e

gcloud compute firewall-rules create reddit-app \
--allow tcp:9292 \
--target-tags=docker-machine \
--description="Allow PUMA 9292" \
--direction=INGRESS
