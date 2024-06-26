#!/bin/bash

# Function to get system name
get_system_name() {
    system_name=$(hostnamectl --static)
    echo "System Name: $system_name"
}

# Function to get CPU information
get_cpu_info() {
    cpu_info=$(lscpu | grep "Model name" | awk -F': ' '{print "CPU: " $2}')
    echo "$cpu_info"
}

# Function to get total RAM
get_ram_info() {
    ram_info=$(free -h | awk '/^Mem:/ {print "RAM: " $2}')
    echo "$ram_info"
}

# Function to get total SSD storage
get_total_ssd_storage() {
    total_ssd_storage=$(lsblk | grep "ssd" | awk '{sum += $4} END {print "Total SSD Storage: " sum}')
    echo "$total_ssd_storage"
}

# Main function to display system information
main() {
    echo "System Information:"
    get_system_name
    get_cpu_info
    get_ram_info
    get_total_ssd_storage
}

# Call the main function
main
