# Login shells (incl. GUI apps probing PATH via `zsh -lc`) need mise tools;
# .zshrc only runs for interactive shells.
command -v mise >/dev/null && eval "$(mise activate zsh --shims)"
