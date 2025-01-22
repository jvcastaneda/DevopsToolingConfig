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

# Check if the script is run with an argument
if [ $# -ne 1 ]; then
    usage
fi

# Check the argument and set the appropriate action
case $1 in
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

    # Check the status of the Prometheus Node Exporter
    sudo systemctl status prometheus-node-exporter
    check_exit_status "Failed to check the status of prometheus-node-exporter"

    # Check the version of the Prometheus Node Exporter
    prometheus-node-exporter --version
    check_exit_status "Failed to check the version of prometheus-node-exporter"

    # Check the Prometheus Node Exporter configuration
    cat /etc/default/prometheus-node-exporter
    check_exit_status "Failed to check the configuration of prometheus-node-exporter"
elif [ "$ACTION" == "upgrade" ]; then
    # Add upgrade logic here
    echo "Upgrade logic not implemented yet"
    exit 1
fi

