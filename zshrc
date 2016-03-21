#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

autoload -U compinit
compinit

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ -s "${ZDOTDIR:-$HOME}/.tmuxinator/scripts/tmuxinator" ]] && source "${ZDOTDIR:-$HOME}/.tmuxinator/scripts/tmuxinator"

if [[ -s "${ZDOTDIR:-$HOME}/.aliasrc" ]]; then
  source "${ZDOTDIR:-$HOME}/.aliasrc"
fi

bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

echo -e "\033]P44040ff\033\\"

if [[ -s "${ZDOTDIR:-$HOME}/.zshrc-mine" ]]; then
  source "${ZDOTDIR:-$HOME}/.zshrc-mine"
fi
# Customize to your needs...

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
