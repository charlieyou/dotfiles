# Use HOMEBREW_PREFIX set by machine-specific ~/.zshrc
: ${HOMEBREW_PREFIX:=/usr/local}

# Starship prompt (modern, fast, customizable)
eval "$(starship init zsh)"

# Autosuggestions (fish-like, shows history as you type)
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
bindkey '^[[C' forward-char  # Right arrow accepts character
bindkey '^E' autosuggest-accept  # Ctrl+E accepts full suggestion

# Syntax highlighting (colorizes commands as you type)
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto-pair parentheses, quotes, brackets (sourced in main .zshrc if not via Homebrew)
[[ -f $HOMEBREW_PREFIX/share/zsh-autopair/autopair.zsh ]] && source $HOMEBREW_PREFIX/share/zsh-autopair/autopair.zsh && autopair-init

# Better completion system
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # Case insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# fzf integration (fuzzy finder for history with Ctrl+R)
# Sourced via ~/.fzf.zsh if installed via git, or inline if in PATH
command -v fzf &>/dev/null && source <(fzf --zsh)

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

alias gs="git status"
alias gp="git push"
alias gc="git commit"

alias vim="nvim"
