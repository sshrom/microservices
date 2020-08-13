#!/bin/bash
echo "DOWNLOADING..."
wget -q --show-progress --https-only --timestamping \
  https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/1.4.1/linux/cfssl \
  https://storage.googleapis.com/kubernetes-the-hard-way/cfssl/1.4.1/linux/cfssljson

echo "MAKING EXECUTABLE..."
chmod +x cfssl cfssljson

echo "MOVING TO BIN ..."
sudo mv cfssl cfssljson /usr/local/bin/
echo "DONE."

echo "CHECKING VERSION..."
cfssl version
cfssljson version
