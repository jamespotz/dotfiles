# dotfiles

Personal configuration files managed with symlinks or a bare git repo.

## What's included

- **fish** — shell configuration
- **ghostty** — terminal emulator
- **nvim** — Neovim editor
- **niri** — Wayland compositor
- **mango** — window manager utilities
- **btop** — system monitor
- **mise** — dev tool version manager
- **starship** — shell prompt
- **swaylock** — screen locker
- **noctalia** — custom color theme & plugins

Plus top-level configs: `.bashrc`, `.editorconfig`, `.gitconfig`.

## Setup

Clone the repo and symlink (or use GNU Stow) to place configs in `~`:

```sh
git clone git@github.com:jamespotz/dotfiles.git ~/dotfiles
cd ~/dotfiles
# example with stow
stow -t ~ .
```

## License

Use however you like.
