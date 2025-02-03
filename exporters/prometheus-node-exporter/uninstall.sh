#!/usr/bin/bash

# Bash script to install Prometheus Node Exporter on a Linux machine (Ubuntu 24.04)

# Function to check the exit status of the previous command and return a non-zero exit status with a message
check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# check if prometheus-node-exporter is installed
prometheus-node-exporter --version
check_exit_status "prometheus-node-exporter is not installed"

# check if prometheus-node-exporter is running
sudo systemctl status prometheus-node-exporter > /dev/null
check_exit_status "prometheus-node-exporter is not running"

# Stop the Prometheus Node Exporter
sudo systemctl stop prometheus-node-exporter
check_exit_status "Failed to stop prometheus-node-exporter"

# Disable the Prometheus Node Exporter
sudo systemctl disable prometheus-node-exporter

# Uninstall Prometheus Node Exporter
sudo apt remove -y prometheus-node-exporter
check_exit_status "Failed to uninstall prometheus-node-exporter"

