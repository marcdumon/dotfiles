#!/usr/bin/env bash

# Ensure destination parent exists
sudo mkdir -p /media/md/Linux_Files/timeshift/snapshots-ondemand/

# Copy the ondemand snapshots
for snap in /mnt/Backup/timeshift/snapshots-ondemand/*; do
    real_snap=$(readlink -f "$snap")
    sudo rsync -aAXHv --ignore-existing --numeric-ids "$real_snap/" "/media/md/Linux_Files/timeshift/snapshots-ondemand/$(basename "$snap")/"
done

# Destination for catalogue
CATALOGUE="/media/md/Linux_Files/timeshift/0_catalogue.txt"

# Wait for timeshift to be free
while true; do
    OUTPUT=$(sudo timeshift --list 2>&1)
    if echo "$OUTPUT" | grep -q "Another instance of this application is running"; then
        echo "Timeshift is busy. Stop other instances before proceeding."
        sleep 10
    else
        {
            echo "==============================="
            echo "Catalog $(date '+%Y-%m-%d %H:%M:%S')"
            echo "==============================="
            echo "$OUTPUT"
            echo
        } | sudo tee -a "$CATALOGUE" > /dev/null
        break
    fi
done
