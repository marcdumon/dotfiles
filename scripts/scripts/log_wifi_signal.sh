#!/usr/bin/env bash
echo "Logs wifi signal strength (dBm) to ~/temp/wifi_signal.log"
while true; do echo "$(date '+%Y-%m-%d %H:%M:%S') $(iw dev wlp1s0 link | grep -oP 'signal: \K[^ ]+') dBm"; sleep 1; done | tee -a ~/temp/wifi_signal.log
