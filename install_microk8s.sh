#!/usr/bin/env bash

# Based on https://microk8s.io/

echo "Installing Microk8s..."

# install
sudo snap install microk8s --classic

# turn on common services
microk8s enable dashboard dns registry istio

# allow running microk8s without sudo
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
