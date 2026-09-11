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

    echo "Processing target: $target"

    # 2. Iterate directly over subdirectories and create symlinks
    for subdir_path in "$SOURCE_DIR"/*/; do
        subdir_name=$(basename "$subdir_path")
        link_destination="$target/$subdir_name"

        # Create symbolic link (-s: symlink, -f: overwrite if existing, -v: verbose output)
        ln -sfv "$subdir_path" "$link_destination"
    done
    echo ""
done

echo "Done!"
