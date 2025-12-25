#!/usr/bin/env bash

# Usage:
#   ./replace_spaces.sh [-r] [path]
#   -r → recursive mode
#   path → defaults to current directory

recursive=false
[[ "$1" == "-r" ]] && { recursive=true; shift; }
DIR="${1:-.}"

if $recursive; then
    echo "Running recursively in '$DIR'..."
    find "$DIR" -depth | while read -r item; do
        newitem="${item// /_}"
        if [[ "$item" != "$newitem" ]]; then
            echo "Renaming: '$item' -> '$newitem'"
            mv "$item" "$newitem"
        fi
    done
else
    echo "Running non-recursively in '$DIR'..."
    for item in "$DIR"/*; do
        [[ -e "$item" ]] || continue
        newitem="${item// /_}"
        if [[ "$item" != "$newitem" ]]; then
            echo "Renaming: '$item' -> '$newitem'"
            mv "$item" "$newitem"
        fi
    done
fi
