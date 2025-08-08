#!/bin/bash

dnf -y install dnf-plugins-core
dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo

dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

systemctl start docker
systemctl enable docker

# Add ec2-user to the docker group to allow running docker commands without sudo
usermod -aG docker ec2-user

# Resize the root and var logical volumes and file systems
growpart /dev/nvme0n1 4
lvextend -L +20G /dev/RootVG/rootVol
lvextend -L +10G /dev/RootVG/varVol

# Resize the file systems
xfs_growfs /
xfs_growfs /var


# Install eksctl
# This script installs eksctl, a command-line tool for managing Kubernetes clusters on AWS EKS
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo install -m 0755 /tmp/eksctl /usr/local/bin && rm /tmp/eksctl

# Install kubectl
# This script installs kubectl, the command-line tool for interacting with Kubernetes clusters
curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.33.3/2025-08-03/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl