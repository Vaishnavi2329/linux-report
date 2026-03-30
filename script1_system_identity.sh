#!/bin/bash
# Script 1: System Identity Report
# Author: Vaishnavi Singh | Roll No: 24BSA10237
# Course: Open Source Software | OSS NGMC Capstone
# Description: Displays a welcome/identity screen for the Linux system
#              showing kernel, user, uptime, distro, date, and license info.

# ─── Variables ────────────────────────────────────────────────────────────────
STUDENT_NAME="Vaishnavi Singh"       # Student's full name
ROLL_NO="24BSA10237"                 # Registration number
SOFTWARE_CHOICE="Git"                # Chosen open-source software for audit

# ─── Gather system information using command substitution ─────────────────────
KERNEL=$(uname -r)                   # Kernel version (e.g. 5.15.0-91-generic)
USER_NAME=$(whoami)                  # Currently logged-in username
HOME_DIR=$HOME                       # Home directory of the current user
UPTIME=$(uptime -p)                  # Human-readable uptime (e.g. up 2 hours)
DATETIME=$(date '+%A, %d %B %Y  %H:%M:%S')   # Formatted current date and time

# ─── Detect Linux distribution name ──────────────────────────────────────────
# /etc/os-release is the standard file for distro info on modern systems
if [ -f /etc/os-release ]; then
    DISTRO=$(grep '^PRETTY_NAME' /etc/os-release | cut -d= -f2 | tr -d '"')
else
    DISTRO="Unknown Linux Distribution"   # Fallback if file doesn't exist
fi

# ─── License information for the OS kernel ────────────────────────────────────
# The Linux kernel is licensed under GNU GPL v2
OS_LICENSE="GNU General Public License v2 (GPL-2.0)"

# ─── Display formatted output ─────────────────────────────────────────────────
echo "========================================================"
echo "        Open Source Audit — System Identity Report      "
echo "========================================================"
echo ""
echo "  Student   : $STUDENT_NAME ($ROLL_NO)"
echo "  Software  : $SOFTWARE_CHOICE (Chosen for Audit)"
echo ""
echo "──────────────────── System Details ────────────────────"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  User         : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date & Time  : $DATETIME"
echo ""
echo "──────────────────── License Info ──────────────────────"
echo "  OS License   : $OS_LICENSE"
echo "  This means   : You have the freedom to run, study,"
echo "                 modify, and distribute this OS."
echo "========================================================"
echo ""
