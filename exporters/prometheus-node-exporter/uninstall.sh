#!/usr/bin/bash

# Bash script to uninstall Prometheus Node Exporter on a Linux machine (Ubuntu 24.04)

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

# check if prometheus-node-exporter is installed
$package_name --version
check_exit_status "$package_name is not installed"

# check if prometheus-node-exporter is running
sudo systemctl status $package_name > /dev/null
check_exit_status "$package_name is not running"

# Check if prometheus-node-exporter is on hold
if sudo apt-mark showhold | grep $package_name; then
    echo "$package_name is on hold"
    sudo apt-mark unhold $package_name
    check_exit_status "Failed to remove $package_name from hold"
else
    echo "$package_name is not on hold"
fi

# Stop the Prometheus Node Exporter
sudo systemctl stop $package_name
check_exit_status "Failed to stop $package_name"

# Disable the Prometheus Node Exporter
sudo systemctl disable $package_name

# Uninstall Prometheus Node Exporter
sudo apt remove -y $package_name
check_exit_status "Failed to uninstall $package_name"
