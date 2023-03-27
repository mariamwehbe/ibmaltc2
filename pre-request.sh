#!/bin/bash

# docker install
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# UFW configure & update
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw enable
sudo ufw status verbose