#!/bin/bash
# Robust duplicate finder, all temp files in ~/temp
# Usage: ./find_dup.sh /path/to/scan

DIR=${1:-.}
TMPDIR="$HOME/temp"
mkdir -p "$TMPDIR"


TMPFILE="$TMPDIR/files_size.txt"
CANDIDATES="$TMPDIR/files_candidates.txt"
DUPLICATES="$TMPDIR/duplicates.txt"

echo "Scanning files in $DIR ..."

# Step 1: list files safely without xargs
find "$DIR" -type f -print0 | while IFS= read -r -d '' file; do
    # stat safely
    size=$(stat -c "%s" "$file" 2>/dev/null) || continue
    echo -e "${size}\t${file}"
done > "$TMPFILE"

echo "Filtering candidate files with duplicate sizes ..."
# Step 2: use awk to select duplicate sizes
awk -F'\t' '{count[$1]++; files[$1]=files[$1] "\n"$2} END {for (s in count) if(count[s]>1) print files[s]}' "$TMPFILE" | sed '/^$/d' > "$CANDIDATES"

echo "Computing hashes for potential duplicates ..."
while IFS= read -r file; do
    [ -n "$file" ] || continue
    [ -f "$file" ] || continue
    sha256sum "$file"
done < "$CANDIDATES" | sort | uniq -w64 -D > "$DUPLICATES"

echo "Duplicate check complete!"
echo "Temp files and final duplicates are in $TMPDIR"
