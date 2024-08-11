#!/bin/bash

# Variables
BACKUP_DIR=/path/to/file # Replace with your desired backup directory
DRIVE_PATH=/drive/path  # Drive path to copy files from

# Check if the drive has a disk
check_drive() {
    echo "Checking drive $DRIVE_PATH..."
    if [ -b "$DRIVE_PATH" ]; then
        echo "Drive $DRIVE_PATH is present."
        return 0
    else
        echo "Drive $DRIVE_PATH is not present."
        return 1
    fi
}

# Check if the disk is ready
check_disk_ready() {
    echo "Checking if disk is ready..."
    if makemkvcon info disc:0 | grep -q "Failed to open disc"; then
        echo "Disk is not ready."
        return 1
    else
        echo "Disk is ready."
        return 0
    fi
}

# Rip the disk using makemkvcon
rip_disk() {
    echo "Ripping disk from $DRIVE_PATH to $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    if makemkvcon mkv disc:0 all "$BACKUP_DIR" --minlength=600; then
        echo "Rip successful."
        return 0
    else
        echo "Rip failed."
        return 1
    fi
}

# Eject the disk
eject_disk() {
    echo "Ejecting disk from drive $DRIVE_PATH..."
    eject "$DRIVE_PATH"
}

# Main loop
while true; do
    if check_drive; then
        if check_disk_ready; then
            if rip_disk; then
                eject_disk
                echo "Process completed. Waiting for next disk..."
            else
                echo "Rip failed. Please check the disk and try again."
            fi
        else
            echo "Disk is not ready. Waiting..."
        fi
    else
        echo "No disk detected. Waiting..."
    fi
    sleep 60  # Wait for 60 seconds before checking again
done
