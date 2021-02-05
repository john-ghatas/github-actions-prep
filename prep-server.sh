#!/bin/bash
sudo groupadd devs # Create a group to assign the permissions to
sudo useradd -m ci # Add the CI user on the machine
sudo usermod -aG devs ci #  Assign the devs group to the CI User to give correct file permissions
sudo usermod -aG sudo ci # Enable sudo (with password) on the CI user 
sudo usermod -aG docker ci # Give access to the Docker daemon on the CI user
sudo mkdir -p /data/www/ # Any other folder path is fine too!
sudo chown ci:devs -R /data # Assign the create folder to the ci user and the devs group

echo "Initializing of the CI user with the permissions is complete, set the correct deployment keys/secrets in the server and you're ready to start deploying automatically on the server!"
echo "When creating deployment scripts make sure to re-enforce permissions and avoid any permissions based issues!"