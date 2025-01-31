#!/usr/bin/bash

# Bash script to install Prometheus Node Exporter on a Linux machine (Ubuntu 24.04)

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
sudo apt install -y prometheus-node-exporter
check_exit_status "Failed to install prometheus-node-exporter"

# Start the Prometheus Node Exporter
sudo systemctl start prometheus-node-exporter
check_exit_status "Failed to start prometheus-node-exporter"

# Enable the Prometheus Node Exporter
sudo systemctl enable prometheus-node-exporter
check_exit_status "Failed to enable prometheus-node-exporter"
    