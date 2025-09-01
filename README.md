# My Dotfiles

This directory contains my personal configuration files (dotfiles) for various applications and tools. These files help me maintain a consistent environment across different systems.

## Requirements

Ensure you have the following tools installed:

- Git
- stow

```bash
sudo apt-get install git stow
```

## Installation

Clone the repository and use `stow` to create symlinks for the configuration files.

```bash
git clone git@github.com/jamespotz/dotfiles.git
cd dotfiles
stow . #to symlink the config files to your home directory
```

### Other depeendencies

asdf
bat
btop
fastfetch
fzf
gemini-cli
git-delta
helix
jq
lazydocker
lazygit
luarocks
mcfly
neovim
serverless
starship
stow
tlrc
tmux
tree-sitter
zoxide
