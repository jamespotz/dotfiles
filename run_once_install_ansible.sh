#!/usr/bin/env bash
set -euo pipefail

# Prompt for username
read -rp "Enter the username to create: " NEW_USER

# Prompt for password (hidden)
read -srp "Enter password for $NEW_USER: " NEW_PASS
echo

# Install sudo and shadow
sudo pacman -Sy --needed --noconfirm sudo shadow

# Make sure wheel group exists
if ! getent group wheel >/dev/null; then
  sudo groupadd wheel
fi

# Create user if missing
if ! id "$NEW_USER" >/dev/null 2>&1; then
  sudo useradd -m -G wheel -s /bin/bash "$NEW_USER"
fi

# Set password
echo "$NEW_USER:$NEW_PASS" | sudo chpasswd

# 1. Install Ansible via pacman if not installed
if ! command -v ansible-playbook >/dev/null 2>&1; then
  echo "Installing ansible..."
  sudo pacman -Syu --needed --noconfirm ansible
fi

# 2. Install required Ansible collections
echo "Installing required Ansible collections..."
ansible-galaxy collection install community.general kewlfft.aur --force

# 3. Run the playbook locally
echo "Running playbook"
ansible-playbook ~/.bootstrap/setup.yaml -e "aur_user=$NEW_USER" --ask-become-pass
