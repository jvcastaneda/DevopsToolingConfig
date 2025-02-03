#!/usr/bin/bash

# Bash script to update the Prometheus Node Exporter plugin on a Linux machine (Ubuntu 24.04) for RabbitMQ

# Function to check the exit status of the previous command and return a non-zero exit status with a message
check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# the version of the Prometheus Node Exporter plugin is tied to the version of the RabbitMQ server
echo "Nothing to do here since the Prometheus Node Exporter plugin is tied to the version of RabbitMQ"