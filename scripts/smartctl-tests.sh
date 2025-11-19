#!/bin/bash
# Run SMART quick and long tests (Linux / Live USB)
DEVICE=/dev/sda
sudo smartctl -a $DEVICE
echo "Starting long self-test (may take hours)..."
sudo smartctl -t long $DEVICE
