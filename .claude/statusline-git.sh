#!/bin/bash

# Read input from stdin
input=$(cat)

# Extract model and directory info
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
dir=$(echo "$input" | jq -r '.workspace.current_dir // "~"' | sed "s|^$HOME|~|")
dir_name=$(basename "$dir")

# Get git information
cd "$(echo "$input" | jq -r '.workspace.current_dir // "~"')" 2>/dev/null || cd ~

git_info=""
if git rev-parse --git-dir >/dev/null 2>&1; then
    # Get current branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null || "unknown")
    
    # Check if working directory is clean
    if git diff-index --quiet HEAD -- 2>/dev/null; then
        # Clean repository
        git_status="✓"
    else
        # Dirty repository
        git_status="✗"
    fi
    
    git_info="🌿 $branch $git_status"
else
    git_info="📁 no git"
fi

# Print status line with dimmed colors and icons
printf '\033[2m🤖 %s 📂 %s %s\033[0m' "$model" "$dir_name" "$git_info"