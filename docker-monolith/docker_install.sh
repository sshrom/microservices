#!/bin/bash
# 10.05.2020 sshrom
set -e
echo "Installing packages to allow apt to use a repository over HTTPS..."
apt-get update

apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

echo "Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    | apt-key add -

echo "Verify"
apt-key fingerprint 0EBFCD88

echo "Setting up the stable repository..."
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "Updating the apt package index, and installing the latest version of Docker Engine and containerd..."
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io

echo "Done!"

