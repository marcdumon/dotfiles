#!/bin/bash
WORKSPACE="/mnt/Dev/aiworkspace"
# Create workspace if it doesn't exist
mkdir -p "$WORKSPACE"
# Ensure correct ownership
sudo chown -R ai_agent:ai_agent "$WORKSPACE"
# Run Pi as the pi user, starting in the workspace
sudo -u ai_agent bash -c "cd \"$WORKSPACE\" && exec pi \"\$@\""
