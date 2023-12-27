#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Add the dockeradmin user
useradd dockeradmin

# Set the password for dockeradmin
echo "Please enter a password for dockeradmin:"
passwd dockeradmin

# Add dockeradmin to the docker group
usermod -aG docker dockeradmin

# Wait for 2 seconds
sleep 2

# Move the sshd_config file to the correct location
mv ./cosc2767-assignment2-website/sshd_config /etc/ssh/sshd_config

# Reload the SSHD service
service sshd reload

echo "Setup completed."
