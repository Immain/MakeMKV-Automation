#!/bin/bash

# Variables
BACKUP_DIR=/path/to/file
DRIVE_PATH=/path/to/drive
SETTINGS_FILE=~/.MakeMKV/settings.conf
FORUM_URL="https://forum.makemkv.com/forum/viewtopic.php?t=1053"

# Function to update MakeMKV key
update_makemkv_key() {
    echo "Updating MakeMKV key..."
    # Fetch the key from the forum
    KEY=$(curl -s "$FORUM_URL" | grep -oP '(?<=<code>)T-[^<]+(?=</code>)')
    
    if [ -n "$KEY" ]; then
        # Check if the key already exists in the settings file
        if grep -q "app_Key" "$SETTINGS_FILE"; then
            # Update existing key with quotes
            sed -i "s/app_Key = .*/app_Key = \"$KEY\"/" "$SETTINGS_FILE"
        else
            # Add new key with quotes
            echo "app_Key = \"$KEY\"" >> "$SETTINGS_FILE"
        fi
        echo "MakeMKV key updated successfully."
    else
        echo "Failed to fetch MakeMKV key."
    fi
}

# Function to check if the drive has a disk
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

# Function to check if the disk is ready
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

# Function to rip the disk using makemkvcon
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

# Function to eject the disk
eject_disk() {
    echo "Ejecting disk from drive $DRIVE_PATH..."
    eject "$DRIVE_PATH"
}

# Function to prompt user to continue or exit
prompt_continue() {
    read -p "Do you want to continue with another disk? (y/n): " choice
    case "$choice" in
        y|Y ) return 0;;
        n|N ) echo "Exiting script."; exit 0;;
        * ) echo "Invalid input. Please enter 'y' or 'n'."; prompt_continue;;
    esac
}

# Main execution loop
while true; do
    # Update MakeMKV key before each iteration
    update_makemkv_key

    if check_drive; then
        if check_disk_ready; then
            if rip_disk; then
                eject_disk
                echo "Process completed."
                prompt_continue  # Ask user if they want to continue with another disk
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
