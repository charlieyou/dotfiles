# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""  # Disabled - using Starship instead

# Plugins (loaded via Oh My Zsh)
plugins=(
  git
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  zsh-shift-select
  zsh-autopair
  fzf
)

source $ZSH/oh-my-zsh.sh

# Starship prompt - init moved to end of ~/.zshrc (after PATH is set)

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
bindkey '^ ' autosuggest-accept

# Better history
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
unsetopt share_history

alias clauded="claude --dangerously-skip-permissions"
alias codexd="codex --dangerously-bypass-approvals-and-sandbox"

alias vim="nvim"
export EDITOR="nvim"

# Exclude special characters from word boundary
WORDCHARS=''

alias gs="git status"

eval "$(starship init zsh)"
