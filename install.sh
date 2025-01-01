#!/bin/bash

# Set timezone to Asia/Manila
sudo timedatectl set-timezone Asia/Manila

# Update and upgrade system
sudo apt-get update
sudo apt-get upgrade -y

# Install curl
sudo apt-get install curl -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Prompt user for the username
read -p "Enter the username to create: " USERNAME

# Create the user and configure permissions
sudo adduser "$USERNAME"
sudo usermod -aG sudo "$USERNAME"
sudo usermod -aG docker "$USERNAME"

su "$USERNAME"
echo "All done."
