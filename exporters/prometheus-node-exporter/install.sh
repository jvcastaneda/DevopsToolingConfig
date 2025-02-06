#!/usr/bin/bash

# Bash script to install Prometheus Node Exporter on a Linux machine (Ubuntu 24.04)
# The following URL will need to get whitelisted in the billrmd firewall to allow the apt to download the package
# Get:1 http://us-west-1.ec2.archive.ubuntu.com/ubuntu noble/universe amd64 prometheus-node-exporter amd64 1.7.0-1 [4491 kB]


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


# Update the system
sudo apt update
check_exit_status "Failed to update the system"

# Install Prometheus Node Exporter
sudo apt install -y $package_name=$package_version
check_exit_status "Failed to install prometheus-node-exporter"

# Lock the version of Prometheus Node Exporter
sudo apt-mark hold $package_name

# Verify the package-name installation
sudo apt list --installed | grep $package_name
check_exit_status "Failed to verify the installation of $package_name"

# Start the Prometheus Node Exporter
sudo systemctl start prometheus-node-exporter
check_exit_status "Failed to start prometheus-node-exporter"

# Enable the Prometheus Node Exporter
sudo systemctl enable prometheus-node-exporter
check_exit_status "Failed to enable prometheus-node-exporter"
