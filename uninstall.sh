#!/bin/bash

# Exit on error, unset variables, or pipeline failures
set -euo pipefail

# Get the directory where this script is saved and resolve the ./skills folder relative to it
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/config.sh"

# 1. Iterate through target directories
for target in "${TARGET_DIRS[@]}"; do
    if [ ! -d "$target" ]; then
        echo "Skipping: Target directory '$target' does not exist."
        continue
    fi

    echo "Processing target for removal: $target"

    # 2. Check each expected symlink location
    for subdir_path in "$SOURCE_DIR"/*/; do
        subdir_name=$(basename "$subdir_path")
        link_location="$target/$subdir_name"

        # Check if the location exists AND is specifically a symlink (-L)
        if [ -L "$link_location" ]; then
            rm -v "$link_location"
        else
            echo "Skipping: '$link_location' is not a symlink or does not exist."
        fi
    done
    echo ""
done

echo "Cleanup complete!"
