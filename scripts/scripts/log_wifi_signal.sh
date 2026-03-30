#!/usr/bin/env bash

for i in $(seq 150); do echo "$(date +%T) $(iw dev wlp1s0 link | grep -oP 'signal: \K[^ ]+') dBm"; sleep 2; done | tee ./temp/wifi_signal.log
