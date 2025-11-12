#!/bin/bash
# Script: keep_random_n.sh
# Description: Recursively keeps N random files per directory and deletes the rest.

KEEP_COUNT=100   # <-- Set how many files to keep per directory

BASE_DIR="$(pwd)"  # Current directory

echo "Keeping up to $KEEP_COUNT random files per directory under $BASE_DIR"
echo "------------------------------------------------------------"

# Find all directories recursively
find "$BASE_DIR" -type d | while IFS= read -r DIR; do
    TOTAL=$(find "$DIR" -maxdepth 1 -type f | wc -l)
    
    if [ "$TOTAL" -le "$KEEP_COUNT" ]; then
        echo "Skipping $DIR (only $TOTAL files)"
        continue
    fi

    echo "Processing $DIR ($TOTAL files)..."

    find "$DIR" -maxdepth 1 -type f -print0 | shuf -z | tail -zn +"$((KEEP_COUNT + 1))" | xargs -0 -r rm -f
done

echo "Done. Kept up to $KEEP_COUNT files per directory."
