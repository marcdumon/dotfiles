#!/usr/bin/env bash

# Usage: ./rename_to_lowercase_verbose.sh /path/to/dir
DIR="${1:-.}"

# Rename directories in top-level only
for d in "$DIR"/*/; do
    [[ -d "$d" ]] || continue
    newdir="$(echo "$d" | tr '[:upper:]' '[:lower:]')"
    if [[ "$d" != "$newdir" ]]; then
        echo "Renaming directory: '$d' -> '$newdir'"
        mv "$d" "$newdir"
    fi
done

# Rename files in top-level only
for f in "$DIR"/*; do
    [[ -f "$f" ]] || continue
    newfile="$(echo "$f" | tr '[:upper:]' '[:lower:]')"
    if [[ "$f" != "$newfile" ]]; then
        echo "Renaming file: '$f' -> '$newfile'"
        mv "$f" "$newfile"
    fi
done
