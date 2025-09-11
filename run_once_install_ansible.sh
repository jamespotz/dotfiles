#!/usr/bin/env bash
set -euo pipefail

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
