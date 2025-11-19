#!/bin/bash
echo "=== macOS Laptop Health Check ==="
echo
echo "Battery:"
pmset -g batt
echo
echo "Disk Info:"
diskutil info disk0
echo
echo "Verifying volume:"
diskutil verifyVolume /
echo
echo "CPU Temp (requires sudo):"
sudo powermetrics --samplers smc | grep -i "CPU die temperature"
