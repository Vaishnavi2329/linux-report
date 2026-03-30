#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: Vaishnavi Singh | Roll No: 24BSA10237
# Course: Open Source Software | OSS NGMC Capstone
# Description: Checks whether the chosen open-source package (git) is installed,
#              displays its version and metadata, and prints a philosophy note
#              about multiple FOSS packages using a case statement.

# ─── Package to inspect ───────────────────────────────────────────────────────
PACKAGE="git"     # Our chosen software for the OSS audit

echo "========================================================"
echo "         FOSS Package Inspector — Script 2              "
echo "========================================================"
echo ""
echo "Inspecting package: $PACKAGE"
echo "────────────────────────────────────────────────────────"

# ─── Check if the package is installed ───────────────────────────────────────
# We try dpkg first (Debian/Ubuntu), then rpm (RHEL/Fedora/CentOS)
# The &>/dev/null suppresses all output so we only act on the exit code

if dpkg -l "$PACKAGE" &>/dev/null; then
    # Package found via dpkg (Debian-based systems)
    echo "[INFO] $PACKAGE is INSTALLED (detected via dpkg)"
    echo ""
    echo "── Package Details ──────────────────────────────────"
    # Use dpkg -s to get full status, pipe through grep to show key fields
    dpkg -s "$PACKAGE" 2>/dev/null | grep -E '^(Version|Status|Maintainer|Homepage)'
    echo ""
    # Also show the git version directly for confirmation
    echo "── Installed Version (from binary) ──────────────────"
    git --version 2>/dev/null

elif rpm -q "$PACKAGE" &>/dev/null; then
    # Package found via rpm (Red Hat-based systems)
    echo "[INFO] $PACKAGE is INSTALLED (detected via rpm)"
    echo ""
    echo "── Package Details ──────────────────────────────────"
    # rpm -qi provides full package information; grep extracts useful lines
    rpm -qi "$PACKAGE" | grep -E 'Version|License|Summary|URL'

else
    # Package is not installed on this system
    echo "[WARN] $PACKAGE is NOT installed on this system."
    echo "       To install it, run:"
    echo "       Debian/Ubuntu : sudo apt install git"
    echo "       RHEL/Fedora   : sudo dnf install git"
fi

echo ""
echo "── Open Source Philosophy Notes ─────────────────────────"
echo "(A case statement mapping each FOSS package to its values)"
echo ""

# ─── Case statement: print a philosophy note for known FOSS packages ──────────
# The case statement checks the PACKAGE variable and prints a relevant
# one-line philosophy note about that software's open-source significance.

case $PACKAGE in
    git)
        echo "Git: Born when proprietary tools failed Linus — freedom in version control."
        ;;
    httpd | apache2)
        echo "Apache: The web server that helped build the open internet, free for all."
        ;;
    mysql | mariadb)
        echo "MySQL/MariaDB: Open-source databases at the heart of millions of web apps."
        ;;
    vlc)
        echo "VLC: Built by students, plays anything — a gift to the world from Paris."
        ;;
    firefox)
        echo "Firefox: A nonprofit browser fighting to keep the web open and user-controlled."
        ;;
    python3 | python)
        echo "Python: Shaped entirely by community consensus — the language that belongs to everyone."
        ;;
    libreoffice)
        echo "LibreOffice: A fork that proved communities can rescue software from corporate control."
        ;;
    *)
        # Default case if the package doesn't match any known FOSS projects
        echo "$PACKAGE: An open-source tool — free to use, study, share, and improve."
        ;;
esac

echo ""
echo "========================================================"
