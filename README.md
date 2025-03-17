# Utility Bash Shell Scripts

This repository contains useful Bash shell scripts for managing CI/CD services and performing system cleanup tasks on Debian/Ubuntu-based systems.

## Scripts

### `ci-cd-services.sh`

This script simplifies the management of Jenkins and SonarQube services, providing a convenient way to start, stop, and check their status. It streamlines the control of these crucial CI/CD components.

**Prerequisites:**

* **Jenkins:** Installed and configured as a systemd service. Refer to the Jenkins documentation for installation and configuration instructions.
* **SonarQube:** Installed and configured as a systemd service. Refer to the SonarQube documentation for installation and configuration instructions.
* **`lsof`:** Used to check if a port is already in use. This utility is typically installed by default on most Linux distributions.
* **`sudo` (required):** The script uses `sudo` to control system services, so you'll need to have sudo privileges to run it.

**Usage:**

```bash
./ci-cd-services.sh {start|stop|status}
```

### `cleanup.sh`

This script performs various system cleanup tasks on a Debian/Ubuntu-based system to free up disk space and remove unnecessary files. It targets APT cache, unnecessary packages, old kernels, orphaned packages, thumbnail cache, systemd journal logs, old log files, and optionally unused Docker images and containers, Snap packages, Flatpak installations, NPM/Yarn cache, and Python Pip cache.

# DevOps Bash Shell Scripts

The remaining scripts are examples of Shell script usage and automation of common DevOps Tasks.

**Prerequisites:**

* **Root privileges:** The script *must* be run as root using `sudo`.
* **Standard command-line utilities:** `df`, `tail`, `awk`, `find`, `truncate`, `rm`, `xargs`.
* **Optional (depending on usage):** `docker`, `snap`, `flatpak`, `npm`, `yarn`, `pip`. If you use the corresponding cleanup options, these tools must be installed.

**Usage:**

```bash
sudo ./cleanup.sh [options]
```

## License

This project is licensed under the MIT License.
