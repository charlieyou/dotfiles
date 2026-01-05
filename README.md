# dotfiles

## Setup

```bash
# tmux
ln -sf ~/dotfiles/tmux.conf ~/.tmux.conf

# zsh
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc

# starship
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml

# ghostty (local machine only)
ln -sf ~/dotfiles/ghostty/config ~/.config/ghostty/config

# scripts
mkdir -p ~/.local/bin
ln -sf ~/dotfiles/bin/yank ~/.local/bin/yank
```
