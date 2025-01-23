#!/usr/bin/bash

# Bash script to install Prometheus Node Exporter on a Linux machine (Ubuntu 24.04)

# Function to check the exit status of the previous command and return a non-zero exit status with a message
check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Function to display usage information
usage() {
    echo "Usage: $0 {init|upgrade}"
    exit 1
}

# Set default action if no argument is provided
DEFAULT_ACTION="init"

# Check if the script is run with an argument, otherwise use default
ACTION=${1:-$DEFAULT_ACTION}

# Check the argument and set the appropriate action
case $ACTION in
    init)
        ACTION="init"
        ;;
    upgrade)
        ACTION="upgrade"
        ;;
    *)
        usage
        ;;
esac

# Check the action and perform the appropriate action
if [ "$ACTION" == "init" ]; then
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
    
elif [ "$ACTION" == "upgrade" ]; then
    # Add upgrade logic here
    sudo apt update
    check_exit_status "Failed to update the system"

    sudo apt list --upgradable | grep prometheus-node-exporter
    check_exit_status "Failed to check for upgradable packages"

    sudo apt upgrade -y prometheus-node-exporter
    check_exit_status "Failed to upgrade prometheus-node-exporter"  
fi
