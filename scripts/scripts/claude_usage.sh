#!/bin/bash

echo "=== DAILY (this month) ==="
npx ccusage daily --since "$(date +%Y%m01)" --breakdown model
