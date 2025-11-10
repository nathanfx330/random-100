#!/bin/bash
# Script: keep_random_100.sh
# Description: Recursively keeps 100 random files per directory and deletes the rest.
# Usage: ./keep_random_100.sh

BASE_DIR="$(pwd)"  # Current directory

# Find all directories recursively
find "$BASE_DIR" -type d | while IFS= read -r DIR; do
    # Count files in this directory
    TOTAL=$(find "$DIR" -maxdepth 1 -type f | wc -l)
    
    if [ "$TOTAL" -le 100 ]; then
        echo "Skipping $DIR (only $TOTAL files)"
        continue
    fi

    echo "Processing $DIR ($TOTAL files)..."

    # Directly stream files to xargs to delete, avoiding variables
    find "$DIR" -maxdepth 1 -type f -print0 | shuf -z | tail -zn +101 | xargs -0 -r rm -f
done

echo "Done. Kept up to 100 files per directory."
