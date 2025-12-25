#!/usr/bin/env bash

# Usage: ./rename_dash.sh /path/to/dir

DIR="${1:-.}"

# First, rename directories bottom-up
find "$DIR" -depth -type d | while read -r dir; do
    newdir="$(echo "$dir" | tr '-' '_')"
    if [[ "$dir" != "$newdir" ]]; then
        echo "Renaming directory: '$dir' -> '$newdir'"
        mv "$dir" "$newdir"
    fi
done

# Then, rename files
find "$DIR" -type f | while read -r file; do
    newfile="$(echo "$file" | tr '-' '_')"
    if [[ "$file" != "$newfile" ]]; then
        echo "Renaming file: '$file' -> '$newfile'"
        mv "$file" "$newfile"
    fi
done
