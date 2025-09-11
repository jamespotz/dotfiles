#!/usr/bin/env bash
set -euo pipefail

# Uncomment en_US.UTF-8 in /etc/locale.gen
sudo sed -i 's/^#en_US.UTF-8/en_US.UTF-8/' /etc/locale.gen
sudo locale-gen
echo "LANG=en_US.UTF-8" >/etc/locale.conf
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

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
ansible-playbook ~/.bootstrap/setup.yaml --ask-become-pass
