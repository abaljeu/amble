#!/bin/bash
# Script to copy .github/global-instructions to each subproject's .github/ directory
# Usage: bash copy-global-instructions.sh

set -e

GLOBAL_INSTRUCTIONS=".github/global-instructions"

# Find all subdirectories containing a .github folder
find . -type d -name ".github" | while read dir; do
    # Skip the root .github directory
    if [ "$dir" = "./.github" ]; then
        continue
    fi
    # Copy the global instructions file
    cp "$GLOBAL_INSTRUCTIONS" "$dir/"
    echo "Copied $GLOBAL_INSTRUCTIONS to $dir/"
done
