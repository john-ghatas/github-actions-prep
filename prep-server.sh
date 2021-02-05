#!/bin/bash
sudo groupadd devs # Create a group to assign the permissions to
sudo useradd -G devs,sudo,docker -m ci # Add the CI user on the machine and assign the groups
sudo mkdir -p /data/www/ # Any other folder path is fine too!
sudo chown ci:devs -R /data # Assign the create folder to the ci user and the devs group

echo "Initializing of the CI user with the permissions is complete, set the correct deployment keys/secrets in the server and you're ready to start deploying automatically on the server!"
echo "When creating deployment scripts make sure to re-enforce permissions and avoid any permissions based issues!"

