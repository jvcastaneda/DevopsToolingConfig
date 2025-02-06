#!/usr/bin/bash

# Bash script to update the Prometheus Node Exporter on a Linux machine (Ubuntu 24.04)

# declare global variables
package_name="prometheus-node-exporter"
package_version="1.7.0-1"

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

sudo apt list --upgradable | grep $package_name
check_exit_status "Failed to check for upgradable packages"

# Check if prometheus-node-exporter is on hold
if sudo apt-mark showhold | grep $package_name; then
    echo "$package_name is on hold"
    sudo apt-mark unhold $package_name
    check_exit_status "Failed to remove $package_name from hold"
else
    echo "$package_name is not on hold"
fi

sudo apt upgrade -y $package_name
check_exit_status "Failed to upgrade $package_name"

# Lock the version of Prometheus Node Exporter
sudo apt-mark hold $package_name