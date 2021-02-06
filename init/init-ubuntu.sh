#!/bin/bash

# Install required packages and run updates
sudo apt update && sudo apt dist-upgrade -y
sudo apt install nginx docker.io python3 python3-pip git -y
sudo ln -snf /usr/bin/pip3 /usr/bin/pip

# Install Docker-Compose
sudo pip install docker-compose

# Install ClamAV
sudo apt-get install clamav clamav-daemon -y

# Install Node.js v14
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt-get install nodejs -y
sudo npm i -g npm@latest

# Create group and add CI user with appriopiate permissions
sudo groupadd devs # Create a group to assign the permissions to
sudo useradd -G devs,sudo,docker -m ci # Add the CI user on the machine and assign the groups
sudo mkdir -p /data/www/ # Any other folder path is fine too!
sudo chown ci:devs -R /data # Assign the create folder to the ci user and the devs group
