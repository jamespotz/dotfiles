# dotfiles

This repo contains the configuration to setup my machines. This is using [Chezmoi](https://chezmoi.io), the dotfile manager to setup the install.

## Setup user in WSL ARCH distro

```shell
pacman -S --noconfirm sudo
useradd -m -G wheel -s /bin/bash $USER
passwd $USER

# Use sed to uncomment the line for the wheel group
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoe
```

## Set the new user as the default for WSL

To automatically log into this new user when opening the Arch Linux WSL session, run this command from a Windows command shell (like Command Prompt or PowerShell). Replace username with the user you created:

```shell
Arch.exe config --default-user username
```

Or edit `/etc/wsl.conf`

```
[user]
default=username
```

## Or Automate it using this script

```shell
bash <(curl -s https://raw.githubusercontent.com/jamespotz/dotfiles/master/executable_setup-arch.sh)
```

## How to run

```shell
export GITHUB_USERNAME=jamespotz
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```
