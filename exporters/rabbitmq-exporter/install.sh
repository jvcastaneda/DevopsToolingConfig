#!/usr/bin/bash

# Bash script to enable Prometheus Node Exporter plugin on a Linux machine (Ubuntu 24.04) for RabbitMQ

# Function to check the exit status of the previous command and return a non-zero exit status with a message
check_exit_status() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Enable the Prometheus Node Exporter plugin
sudo rabbitmq-plugins enable rabbitmq_prometheus
check_exit_status "Failed to enable rabbitmq_prometheus"
