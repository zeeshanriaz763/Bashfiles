#!/bin/bash
echo "My name is Zeeshan Riaz"
# Display system name
echo "System Name: $(hostname)"

# Number of running CPUs
echo "CPU: $(nproc --all)"

# RAM information
echo "RAM: $(free -h | awk '/Mem:/ {print $2}')"

# Total SSD storage
echo "Total SSD Storage: $(df -h | grep '/dev/sd' | awk '{sum += $2} END {print sum}')"

