#!/usr/bin/env bash

# Install Docker Compose
# Instructions from https://docs.docker.com/compose/install/

# IMPORTANT: The path is hardcoded to a specific version. You may wish to update it

# download
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# make it executable
sudo chmod +x /usr/local/bin/docker-compose
