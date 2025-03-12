#!/bin/bash

# Warning message
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit 1
fi

# Calculate initial disk space
initial_space=$(df / | tail -1 | awk '{print $4}')

# Update package lists
echo "Updating package lists..."
sudo apt-get update

# Clean up APT cache
echo "Cleaning up APT cache..."
sudo apt-get clean

# Remove unnecessary packages
echo "Removing unnecessary packages..."
sudo apt-get autoremove -y

# Remove old kernels
echo "Removing old kernels..."
sudo apt-get autoremove --purge -y

# Clean up orphaned packages
echo "Cleaning up orphaned packages..."
sudo deborphan | xargs sudo apt-get -y remove --purge

# Clean up thumbnail cache
echo "Cleaning up thumbnail cache..."
rm -rf ~/.cache/thumbnails/*

# Clean up systemd journal logs
echo "Cleaning up systemd journal logs..."
sudo journalctl --vacuum-time=3days

# Clean up old log files
echo "Cleaning up old log files..."
sudo find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;

# Clean up unused Docker images and containers (if Docker is installed)
if command -v docker &> /dev/null
then
    echo "Cleaning up unused Docker images and containers..."
    docker system prune -af
fi

# Clean up unused Snap packages
echo "Cleaning up unused Snap packages..."
sudo snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do sudo snap remove "$snapname" --revision="$revision"; done

# Clean up Trash
echo "Cleaning up Trash..."
rm -rf ~/.local/share/Trash/*

# Clean up Flatpak cache
if command -v flatpak &> /dev/null
then
    echo "Cleaning up Flatpak cache..."
    flatpak uninstall --unused -y
fi

# Clean up NPM/Yarn cache
if command -v npm &> /dev/null
then
    echo "Cleaning up NPM cache..."
    npm cache clean --force
fi

if command -v yarn &> /dev/null
then
    echo "Cleaning up Yarn cache..."
    yarn cache clean
fi

# Clean up Python Pip cache
if command -v pip &> /dev/null
then
    echo "Cleaning up Python Pip cache..."
    pip cache purge
fi

# Calculate final disk space
final_space=$(df / | tail -1 | awk '{print $4}')
freed_space=$((final_space - initial_space))

echo "Disk cleanup completed."
echo "Freed up $((freed_space / 1024)) MB of disk space."
