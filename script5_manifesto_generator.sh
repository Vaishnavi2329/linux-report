#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: Vaishnavi Singh | Roll No: 24BSA10237
# Course: Open Source Software | OSS NGMC Capstone
# Description: Interactively asks the user three questions, then composes
#              a personalised open-source philosophy statement and saves
#              it to a .txt file. Demonstrates: read, string concatenation,
#              file output with >, date command, and aliases (via comments).

# ─── Alias demonstration ──────────────────────────────────────────────────────
# In real shell sessions, aliases let you create shorthand commands.
# For example: alias today='date +%d\ %B\ %Y'
# We demonstrate the concept here and use the underlying command directly.
# (Aliases don't persist inside scripts by default, but are key for daily use.)

echo "========================================================"
echo "     Open Source Manifesto Generator — Script 5        "
echo "========================================================"
echo ""
echo "Answer three questions to generate your personal"
echo "open-source philosophy manifesto."
echo ""

# ─── Gather user input with the 'read' command ───────────────────────────────
# read -p shows a prompt and stores the user's answer in a variable

read -p "1. Name one open-source tool you use every day: " TOOL

read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM

read -p "3. Name one thing you would build and share freely: " BUILD

# ─── Validate input: ensure none of the answers are blank ────────────────────
if [ -z "$TOOL" ] || [ -z "$FREEDOM" ] || [ -z "$BUILD" ]; then
    echo ""
    echo "[ERROR] All three questions must be answered. Please re-run the script."
    exit 1
fi

# ─── Get current date using the date command ─────────────────────────────────
DATE=$(date '+%d %B %Y')    # e.g. 15 March 2025

# ─── Compose the output filename using string concatenation ──────────────────
# $(whoami) gets the current username; we append it to the base filename
OUTPUT="manifesto_$(whoami).txt"

# ─── Build the manifesto paragraph using string variables ────────────────────
# This demonstrates string concatenation and multi-line echo with >>

# First, write the header to the file (> overwrites, creates if not exists)
echo "==========================================" > "$OUTPUT"
echo "   MY OPEN SOURCE MANIFESTO               " >> "$OUTPUT"
echo "   Generated on: $DATE                    " >> "$OUTPUT"
echo "==========================================" >> "$OUTPUT"
echo ""                                           >> "$OUTPUT"

# Compose and write the personalised manifesto paragraph
# Variables $TOOL, $FREEDOM, $BUILD are substituted at runtime
echo "I am someone who believes in the power of open software." >> "$OUTPUT"
echo "Every day, I rely on $TOOL — a tool I did not build,"     >> "$OUTPUT"
echo "but one that was freely given to me by people who believed" >> "$OUTPUT"
echo "that knowledge should not be locked behind closed doors."  >> "$OUTPUT"
echo ""                                                          >> "$OUTPUT"
echo "To me, freedom means $FREEDOM."                           >> "$OUTPUT"
echo "That single word captures why I think open-source matters:" >> "$OUTPUT"
echo "when the source code is open, no one company controls what" >> "$OUTPUT"
echo "you can do or who you can become with the tools you use."  >> "$OUTPUT"
echo ""                                                          >> "$OUTPUT"
echo "One day, I intend to build $BUILD and share it freely,"   >> "$OUTPUT"
echo "just as others have shared with me. That is the deal at"  >> "$OUTPUT"
echo "the heart of open source: you stand on the shoulders of"  >> "$OUTPUT"
echo "those who came before, and you lift the next person up."  >> "$OUTPUT"
echo ""                                                          >> "$OUTPUT"
echo "— Vaishnavi Singh | 24BSA10237"                           >> "$OUTPUT"
echo "  Open Source Software, VITyarthi"                        >> "$OUTPUT"
echo "  $DATE"                                                   >> "$OUTPUT"
echo "==========================================" >> "$OUTPUT"

# ─── Confirm and display the generated manifesto ─────────────────────────────
echo ""
echo "[OK] Manifesto saved to: $OUTPUT"
echo ""
echo "────── Contents of $OUTPUT ─────────────────────────────"
echo ""
cat "$OUTPUT"   # Display the full contents of the saved file
echo ""
echo "========================================================"
