#!/usr/bin/env bash

DEST="/media/md/Linux_Files/timeshift/snapshots-ondemand/"
sudo mkdir -p "$DEST"

# Copy each ondemand snapshot
for snap in /mnt/Backup/timeshift/snapshots-ondemand/*; do
    real_snap=$(readlink -f "$snap")
    dest="$DEST$(basename "$snap")"
    sudo mkdir -p "$dest"
    sudo rsync -aAXHv --ignore-existing --numeric-ids --inplace "$real_snap/" "$dest/"
done

# Timeshift catalogue
CATALOGUE="/media/md/Linux_Files/timeshift/0_catalogue.txt"
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
