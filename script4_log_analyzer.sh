#!/bin/bash
# Script 4: Log File Analyzer
# Author: Vaishnavi Singh | Roll No: 24BSA10237
# Course: Open Source Software | OSS NGMC Capstone
# Description: Reads a log file line by line using a while-read loop,
#              counts occurrences of a keyword (default: "error"),
#              and prints the last 5 matching lines.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error

# ─── Read command-line arguments ──────────────────────────────────────────────
LOGFILE=$1                     # First argument: path to the log file
KEYWORD=${2:-"error"}          # Second argument: keyword to search (default: "error")

# ─── Counter variable for matched lines ───────────────────────────────────────
COUNT=0

echo "========================================================"
echo "         Log File Analyzer — Script 4                   "
echo "========================================================"
echo ""

# ─── Validate that a log file argument was provided ──────────────────────────
if [ -z "$LOGFILE" ]; then
    echo "[ERROR] No log file specified."
    echo "Usage: $0 <logfile> [keyword]"
    echo "Example: $0 /var/log/syslog error"
    exit 1
fi

# ─── Retry loop: keep prompting if log file is empty or doesn't exist ─────────
# This implements a do-while style retry using a while loop + break
MAX_RETRIES=3      # Maximum number of retries before giving up
ATTEMPT=0          # Current attempt counter

while true; do
    ATTEMPT=$((ATTEMPT + 1))

    # Check if the file actually exists at this path
    if [ ! -f "$LOGFILE" ]; then
        echo "[WARN] File not found: $LOGFILE (Attempt $ATTEMPT of $MAX_RETRIES)"

        # If we've used all retries, exit with an error
        if [ "$ATTEMPT" -ge "$MAX_RETRIES" ]; then
            echo "[ERROR] File could not be found after $MAX_RETRIES attempts. Exiting."
            exit 1
        fi

        # Ask user to provide a different path and retry
        read -p "Enter a valid log file path (or press Ctrl+C to cancel): " LOGFILE
        continue   # Go back to the top of the while loop with new LOGFILE
    fi

    # Check if the file is empty (has no content)
    if [ ! -s "$LOGFILE" ]; then
        echo "[WARN] File exists but is empty: $LOGFILE (Attempt $ATTEMPT of $MAX_RETRIES)"

        if [ "$ATTEMPT" -ge "$MAX_RETRIES" ]; then
            echo "[ERROR] File remains empty. Cannot analyze. Exiting."
            exit 1
        fi

        read -p "Enter a different log file path to try: " LOGFILE
        continue
    fi

    # File exists and has content — break out of retry loop
    break
done

echo "[OK]   Analyzing: $LOGFILE"
echo "[OK]   Searching for keyword: '$KEYWORD' (case-insensitive)"
echo ""
echo "────────────────────────────────────────────────────────"

# ─── While-read loop: read each line of the log file ─────────────────────────
# IFS= prevents leading/trailing whitespace from being stripped
# -r prevents backslash interpretation

while IFS= read -r LINE; do

    # If statement: check if this line contains the keyword (case-insensitive with -i)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))   # Increment the counter variable
    fi

done < "$LOGFILE"   # Feed the file as input to the while loop

# ─── Print summary ────────────────────────────────────────────────────────────
echo "RESULT: Keyword '$KEYWORD' found $COUNT time(s) in:"
echo "        $LOGFILE"
echo ""

# ─── Print the last 5 lines that matched the keyword ─────────────────────────
# grep -i = case-insensitive, then tail -5 = last 5 matching lines
echo "── Last 5 Matching Lines ────────────────────────────────"
MATCHES=$(grep -i "$KEYWORD" "$LOGFILE" | tail -5)

if [ -n "$MATCHES" ]; then
    # Print each of the last 5 matching lines with a line prefix
    echo "$MATCHES" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
else
    echo "  [None found]"
fi

echo ""
echo "========================================================"
