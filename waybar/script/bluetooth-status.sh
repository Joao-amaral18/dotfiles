#!/bin/bash

# Check if Bluetooth is available
if ! command -v bluetoothctl &> /dev/null; then
    echo " Dead"
    exit 0
fi

# Check if Bluetooth service is running
if ! systemctl is-active --quiet bluetooth; then
    echo " Dead"
    exit 0
fi

# Get connected devices
connected_devices=$(bluetoothctl devices Connected | awk '{$1=""; $2=""; print $0}' | sed 's/^[ \t]*//')

if [ -z "$connected_devices" ]; then
    # Check if Bluetooth is powered on
    powered=$(bluetoothctl show | grep "Powered: yes")
    if [ -z "$powered" ]; then
        echo " Dead"
    else
        echo " Disconnected"
    fi
else
    # Get the first connected device
    device_name=$(echo "$connected_devices" | head -n 1)
    echo " $device_name"
fi