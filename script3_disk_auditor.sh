#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: Vaishnavi Singh | Roll No: 24BSA10237
# Course: Open Source Software | OSS NGMC Capstone
# Description: Loops through key system directories and reports their
#              permissions, ownership, and disk usage. Also checks for
#              Git's config directory specifically.

# ─── List of important system directories to audit ────────────────────────────
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/usr/share")

echo "========================================================"
echo "       Disk and Permission Auditor — Script 3           "
echo "========================================================"
echo ""
printf "%-20s %-25s %-10s\n" "Directory" "Permissions (type owner group)" "Size"
echo "────────────────────────────────────────────────────────"

# ─── For loop: iterate over each directory in the DIRS array ─────────────────
for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists on this system
    if [ -d "$DIR" ]; then
        # ls -ld gives details of the directory itself (not its contents)
        # awk extracts fields: $1=permissions, $3=owner, $4=group
        PERMS=$(ls -ld "$DIR" | awk '{print $1, $3, $4}')

        # du -sh gives human-readable size; cut removes the path, keeping only size
        # 2>/dev/null suppresses "permission denied" errors on restricted dirs
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # If du couldn't get the size (permission denied), show a placeholder
        [ -z "$SIZE" ] && SIZE="N/A"

        # Print a formatted row using printf for alignment
        printf "%-20s %-25s %-10s\n" "$DIR" "$PERMS" "$SIZE"
    else
        # Directory doesn't exist — print a clear message instead
        printf "%-20s %-25s\n" "$DIR" "[does not exist on this system]"
    fi
done

echo ""
echo "──────────── Git Config Directory Check ────────────────"

# ─── Check for Git's configuration directory on this system ──────────────────
# Git stores system-wide config in /etc/gitconfig and user config in ~/.gitconfig

GIT_CONFIG_DIR="/etc/git"          # System-level git config directory (if it exists)
USER_GIT_CONFIG="$HOME/.gitconfig" # User-level git configuration file

# Check system git config directory
if [ -d "$GIT_CONFIG_DIR" ]; then
    echo "[FOUND] System Git config dir: $GIT_CONFIG_DIR"
    PERMS=$(ls -ld "$GIT_CONFIG_DIR" | awk '{print $1, $3, $4}')
    echo "        Permissions: $PERMS"
else
    echo "[INFO] $GIT_CONFIG_DIR does not exist (normal if git uses /etc/gitconfig directly)."
fi

# Check user git config file
if [ -f "$USER_GIT_CONFIG" ]; then
    echo "[FOUND] User Git config file: $USER_GIT_CONFIG"
    PERMS=$(ls -l "$USER_GIT_CONFIG" | awk '{print $1, $3, $4}')
    echo "        Permissions: $PERMS"
else
    echo "[INFO] No ~/.gitconfig found for current user ($USER)."
fi

# Check if git binary exists and where it lives
GIT_BIN=$(which git 2>/dev/null)
if [ -n "$GIT_BIN" ]; then
    echo "[FOUND] Git binary located at: $GIT_BIN"
    BIN_PERMS=$(ls -l "$GIT_BIN" | awk '{print $1, $3, $4}')
    echo "        Permissions: $BIN_PERMS"
fi

echo ""
echo "========================================================"
echo "NOTE: Permissions format: [type+perms] [owner] [group]"
echo "      e.g. drwxr-xr-x root root = dir, read/exec for all"
echo "========================================================"
