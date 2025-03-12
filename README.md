# CI/CD Services Management

This repository contains scripts to simplify the management of Jenkins and SonarQube services.

## Scripts

### 1. `ci-cd-services.sh`

This script provides commands to start, stop, and check the status of Jenkins and SonarQube services.

**Prerequisites:**

* Jenkins: Installed and configured as a systemd service.
* SonarQube: Installed and configured as a systemd service.
* `lsof`: Installed (used for port checking).

**Usage:**

```bash
./ci-cd-services.sh {start|stop|status}

# CI/CD Services Management

This repository contains scripts to simplify the management of Jenkins and SonarQube services.

## Scripts

### 1. `ci-cd-services.sh`

This script provides commands to start, stop, and check the status of Jenkins and SonarQube services.

**Prerequisites:**

* Jenkins: Installed and configured as a systemd service.
* SonarQube: Installed and configured as a systemd service.
* `lsof`: Installed (used for port checking).

**Usage:**

```bash
./ci-cd-services.sh {start|stop|status}


### 2. `cleanup.sh`

This script performs cleanup tasks on the system, removing old log files from `/var/log` and temporary files from `/tmp`.  It provides options for customizing the cleanup process, including specifying the age of files to delete and which types of files to clean (logs, temporary files, or both).

**Prerequisites:**

* `find`: Locates files based on specified criteria (age, type, etc.).
* `rm`: Deletes files.
* **`sudo` (required):** This script needs to be run with root privileges to delete files in protected directories like `/var/log`.

**Usage:**

```bash
sudo ./cleanup.sh [options]