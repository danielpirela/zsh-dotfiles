#!/bin/bash

# Script para sincronizar cambios de dotfiles

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Actualizando dotfiles desde ~/ a $DOTFILES_DIR..."

# Copiar archivos modificados
cp ~/.zshrc "$DOTFILES_DIR/"
cp ~/.nanorc "$DOTFILES_DIR/"
cp ~/.config/zsh/*.zsh "$DOTFILES_DIR/config/zsh/"
cp ~/.config/hypr/hyprland.conf "$DOTFILES_DIR/config/hypr/" 2>/dev/null
cp ~/.config/starship.toml "$DOTFILES_DIR/config/" 2>/dev/null

echo "✓ Archivos actualizados"

# Git
cd "$DOTFILES_DIR"
git add .
echo ""
read -p "Mensaje de commit: " commit_msg
git commit -m "$commit_msg"
git push

echo "✓ Cambios subidos a GitHub"