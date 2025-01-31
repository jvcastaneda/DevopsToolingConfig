#!/usr/bin/bash

# Bash script to update the Prometheus Node Exporter on a Linux machine (Ubuntu 24.04)

# Function to check the exit status of the previous command and return a non-zero exit status with a message
check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Add upgrade logic here
sudo apt update
check_exit_status "Failed to update the system"

sudo apt list --upgradable | grep prometheus-node-exporter
check_exit_status "Failed to check for upgradable packages"

sudo apt upgrade -y prometheus-node-exporter
check_exit_status "Failed to upgrade prometheus-node-exporter"  
