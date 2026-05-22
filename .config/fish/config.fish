if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting # Supresses fish's intro message
set TERM xterm-256color # Sets the terminal type
set -gx PATH "$HOME/.local/bin" $PATH

### SET FZF DEFAULTS
set -gx FZF_DEFAULT_OPTS "--layout=reverse --exact --border=bold --border=rounded --margin=3% --color=dark"

mise activate fish | source
zoxide init fish | source
### FZF ###
# Enables the following keybindings:
# CTRL-t = fzf select
# CTRL-r = fzf history
# ALT-c  = fzf cd
fzf --fish | source

if test "$TERM_PROGRAM" != kiro
    starship init fish | source
    atuin init fish | source
end

alias ls='eza --icons --group-directories-first'
alias ll='eza -l --icons --git --group-directories-first'
alias lt='eza --tree --icons'
alias rm=' rm -I --preserve-root'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias ping='ping -c 5'
alias update='sudo dnf update'

string match -q "$TERM_PROGRAM" kiro and . (kiro --locate-shell-integration-path fish)
