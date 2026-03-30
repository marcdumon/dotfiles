#!/usr/bin/env bash
echo "Logs wifi signal strength (dBm) to ~/temp/wifi_signal.log"
for i in $(seq 150); do echo "$(date '+%Y-%m-%d %H:%M:%S') $(iw dev wlp1s0 link | grep -oP 'signal: \K[^ ]+') dBm"; sleep 2; done | tee -a ~/temp/wifi_signal.log
