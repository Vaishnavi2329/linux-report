# oss-audit-24BSA10237

**Open Source Audit — OSS NGMC Capstone Project**

| Field | Details |
|---|---|
| Student Name | Vaishnavi Singh |
| Registration Number | 24BSA10237 |
| Chosen Software | **Git** |
| Course | Open Source Software (OSS NGMC) |
| Units Covered | 1 – 5 |

---

## About This Project

This repository contains the five shell scripts for the Open Source Audit capstone project. The chosen software for the audit is **Git** — the distributed version control system created by Linus Torvalds in 2005, licensed under **GPL v2**.

The full project report (PDF) is submitted separately on the VITyarthi portal.

---

## Repository Contents

```
oss-audit-24BSA10237/
├── script1_system_identity.sh      # System Identity Report
├── script2_package_inspector.sh    # FOSS Package Inspector
├── script3_disk_auditor.sh         # Disk and Permission Auditor
├── script4_log_analyzer.sh         # Log File Analyzer
├── script5_manifesto_generator.sh  # Open Source Manifesto Generator
└── README.md                       # This file
```

---

## Script Descriptions

### Script 1 — System Identity Report
**File:** `script1_system_identity.sh`

Displays a formatted welcome screen showing the Linux distribution name, kernel version, logged-in user, home directory, uptime, current date/time, and the OS license (GPL v2 for the Linux kernel).

**Shell concepts used:** Variables, `echo`, command substitution `$()`, output formatting with `echo`.

---

### Script 2 — FOSS Package Inspector
**File:** `script2_package_inspector.sh`

Checks whether `git` is installed on the system using `dpkg` (Debian/Ubuntu) or `rpm` (RHEL/Fedora). Displays package version, license, and summary. Uses a `case` statement to print a philosophy note about several well-known FOSS packages.

**Shell concepts used:** `if-then-else`, `case` statement, `dpkg`/`rpm`, pipes with `grep`.

---

### Script 3 — Disk and Permission Auditor
**File:** `script3_disk_auditor.sh`

Loops through a list of key system directories (`/etc`, `/var/log`, `/home`, `/usr/bin`, `/tmp`, `/var`, `/usr/share`) and reports each directory's permissions, owner, group, and disk usage. Also specifically checks for Git's binary and config file locations.

**Shell concepts used:** `for` loop, arrays, `ls -ld`, `du -sh`, `awk`, `cut`.

---

### Script 4 — Log File Analyzer
**File:** `script4_log_analyzer.sh`

Reads a log file line by line using a `while read` loop, counts lines containing a specified keyword (default: `error`), and prints the last 5 matching lines. Includes a retry mechanism if the file doesn't exist or is empty.

**Shell concepts used:** `while read` loop, `if-then`, counter variables, command-line arguments (`$1`, `$2`), `grep`, `tail`.

**Usage:**
```bash
./script4_log_analyzer.sh /var/log/syslog error
./script4_log_analyzer.sh /var/log/auth.log WARNING
```

---

### Script 5 — Open Source Manifesto Generator
**File:** `script5_manifesto_generator.sh`

Interactively prompts the user with three questions, then composes a personalised open-source philosophy statement and saves it to a `.txt` file named `manifesto_<username>.txt`. Also demonstrates the alias concept via comments.

**Shell concepts used:** `read` for user input, string concatenation, writing to file with `>` and `>>`, `date` command, alias concept demonstrated in comments.

---

## How to Run the Scripts

### Prerequisites
- A Linux system (Ubuntu, Debian, Fedora, CentOS, or any modern distro)
- Bash shell (version 4.0 or higher — check with `bash --version`)
- `git` installed for Script 2 (`sudo apt install git` or `sudo dnf install git`)

### Step 1 — Clone the repository
```bash
git clone https://github.com/<your-username>/oss-audit-24BSA10237.git
cd oss-audit-24BSA10237
```

### Step 2 — Make scripts executable
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### Step 3 — Run each script

```bash
# Script 1: System Identity Report
./script1_system_identity.sh

# Script 2: FOSS Package Inspector
./script2_package_inspector.sh

# Script 3: Disk and Permission Auditor
./script3_disk_auditor.sh

# Script 4: Log File Analyzer (requires a log file path as argument)
./script4_log_analyzer.sh /var/log/syslog error
# or
./script4_log_analyzer.sh /var/log/auth.log WARNING

# Script 5: Manifesto Generator (interactive)
./script5_manifesto_generator.sh
```

---

## Dependencies

| Dependency | Used In | Install Command |
|---|---|---|
| `bash` | All scripts | Pre-installed on all Linux systems |
| `git` | Script 2 | `sudo apt install git` (Debian/Ubuntu) |
| `dpkg` | Script 2 | Pre-installed on Debian/Ubuntu |
| `rpm` | Script 2 (fallback) | Pre-installed on RHEL/Fedora/CentOS |
| `du`, `df`, `ls` | Script 3 | Pre-installed (coreutils) |
| `grep`, `awk`, `cut` | Scripts 3, 4 | Pre-installed (coreutils/gawk) |
| `date`, `whoami`, `uname` | Scripts 1, 5 | Pre-installed (coreutils) |

---

## Tested On
- Ubuntu 22.04 LTS (Jammy Jellyfish)
- Bash 5.1

---

*Submitted as part of the OSS NGMC Capstone — VITyarthi*
# linux-report
