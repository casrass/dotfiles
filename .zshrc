#!/bin/bash
# with love from jaded <3

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# ----------------------------------------
# paths
# ----------------------------------------

# paths
PATH="/opt/local/bin:/opt/local/sbin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/go/bin:$PATH"
PATH="/opt/metasploit-framework/bin:$PATH"
PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"
PATH="$HOME/.pyenv/bin:$PATH"
export PATH

# manpaths
MANPATH="/opt/local/share/man:$MANPATH"
export MANPATH

# ----------------------------------------
# dotfiles
# ----------------------------------------

# set zsh environment
if [ -f ~/.zsh_environment ]; then
    source ~/.zsh_environment
fi

# alias definitions
if [ -f ~/.zsh_aliases ]; then
	source ~/.zsh_aliases
fi

# alias definitions
if [ -f ~/.zsh_functions ]; then
    source ~/.zsh_functions
fi

# magic to start ssh_agent
if [[ -f ~/.ssh/start_agent ]]; then
	source ~/.ssh/start_agent
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ----------------------------------------
# zplug
# ----------------------------------------

# setup zplug
source /opt/homebrew/opt/zplug/init.zsh

# supports oh-my-zsh plugins and the like
zplug "plugins/git", from:oh-my-zsh

# load completion library for those sßeet [tab] squares
zplug "lib/completion", from:oh-my-zsh

# syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# auto complete
zplug "zsh-users/zsh-autosuggestions", defer:2

# install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "install? [y/n]: "
    if read -q; then
        echo; zplug install
    fi
fi

# load zplug
zplug load

# ----------------------------------------
# zplug
# ----------------------------------------

# iterm indegration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# sdkman stuff
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
