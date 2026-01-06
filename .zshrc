# Use HOMEBREW_PREFIX set by machine-specific ~/.zshrc
: ${HOMEBREW_PREFIX:=/usr/local}

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

# Starship prompt (modern, fast, customizable)
eval "$(starship init zsh)"

# Autosuggestions config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^[[C' forward-char  # Right arrow accepts character
bindkey '^E' autosuggest-accept  # Ctrl+E accepts full suggestion

# Better history
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Edit command in $EDITOR with Ctrl+X Ctrl+E
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

alias clauded="claude --dangerously-skip-permissions"
alias codexd="codex --dangerously-bypass-approvals-and-sandbox"

alias vim="nvim"

WORDCHARS=''
