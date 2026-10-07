# AppImage runtimes export ARGV0. zsh then uses it as argv[0] for every
# external command, so mise thinks it's a shim and `mise activate` fails.
unset ARGV0

export FZF_DEFAULT_OPTS="--layout=reverse --exact --border=bold --border=rounded --margin=3% --color=dark"
export PNPM_HOME="$HOME/.local/share/pnpm"
export NODE_OPTIONS="--max-old-space-size=8192"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

typeset -U path
export PATH="$PNPM_HOME/bin:$HOME/.local/share/bob/nvim-bin:$HOME/.local/bin:$PATH"
