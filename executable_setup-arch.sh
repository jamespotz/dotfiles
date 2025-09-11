#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# --- PRE-RUN CHECKS ---
# This script must be run as the root user.
if [[ $(whoami) != "root" ]]; then
  echo "This script must be run as root. Please run 'wsl -d archlinux -u root' to start."
  exit 1
fi

echo "--- Automated Arch Linux WSL2 Setup ---"
echo "This script will: "
echo "1. Prompt you for a new username and password."
echo "2. Install 'sudo' and update the system."
echo "3. Create a new user with sudo privileges."
echo "4. Automatically log into the new user's shell upon completion."
echo "----------------------------------------"

# --- PROMPT FOR USERNAME AND PASSWORD ---
read -p "Enter a new username: " NEW_USER
read -s -p "Enter a password for the new user: " NEW_PASS
echo
echo "User and password accepted. Starting setup..."

# --- SYSTEM UPDATE AND KEYRING INITIALIZATION ---
echo "Initializing pacman keyring and updating system..."
pacman-key --init
pacman-key --populate archlinux
pacman -Syu --noconfirm

# --- USER CREATION AND SUDO SETUP ---
echo "Installing sudo and creating new user: $NEW_USER"
pacman -S sudo --noconfirm

useradd -m -G wheel -s /bin/bash "$NEW_USER"
echo "$NEW_USER:$NEW_PASS" | chpasswd

# --- SUDOERS CONFIGURATION ---
echo "Enabling 'wheel' group for sudo access..."
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# --- AUTOMATIC LOGIN ---
# Switch to the new user's shell. The 'exec' command replaces the current shell
# process with a new one, so when you exit the new user shell, the terminal will close.
echo "Setup complete. Logging in as user '$NEW_USER'..."
echo "You can exit this session by typing 'exit' or pressing Ctrl+D."
exec su -l "$NEW_USER"

# --- FINAL STEP: RUN chezmoi ---
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $NEW_USER
