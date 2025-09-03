#!/bin/bash
# Script to copy .github/global-instructions.md to each subproject's .github/ directory
# Usage: bash copy-global-instructions.sh

set -e

GLOBAL_INSTRUCTIONS=".github/global-instructions.md"

# Find all subdirectories containing a .github folder, excluding node_modules
find . -type d -name ".github" -not -path "*/node_modules/*" | while read dir; do
    # Skip the root .github directory
    if [ "$dir" = "./.github" ]; then
        continue
    fi
    # Copy the global instructions file if it exists
    if [ -f "$GLOBAL_INSTRUCTIONS" ]; then
        cp "$GLOBAL_INSTRUCTIONS" "$dir/"
        echo "Copied $GLOBAL_INSTRUCTIONS to $dir/"
    else
        echo "Warning: $GLOBAL_INSTRUCTIONS not found"
    fi
done
