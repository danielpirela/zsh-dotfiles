#!/bin/bash

# ============================================
# DOTFILES INSTALLER
# ============================================

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Funciones de utilidad
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

# Directorio de dotfiles
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Backup de configuraciones existentes
backup_configs() {
    print_info "Creando backup de configuraciones existentes..."
    BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$BACKUP_DIR"
    
    # Backup de archivos existentes
    [ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$BACKUP_DIR/"
    [ -f "$HOME/.nanorc" ] && cp "$HOME/.nanorc" "$BACKUP_DIR/"
    [ -d "$HOME/.config/zsh" ] && cp -r "$HOME/.config/zsh" "$BACKUP_DIR/"
    [ -d "$HOME/.config/hypr" ] && cp -r "$HOME/.config/hypr" "$BACKUP_DIR/"
    [ -d "$HOME/.config/waybar" ] && cp -r "$HOME/.config/waybar" "$BACKUP_DIR/"
    [ -d "$HOME/.config/kitty" ] && cp -r "$HOME/.config/kitty" "$BACKUP_DIR/"
    
    print_success "Backup creado en: $BACKUP_DIR"
}

# Instalar paquetes necesarios
install_packages() {
    print_info "Instalando paquetes necesarios..."
    
    PACKAGES=(
        "zsh"
        "git"
        "fzf"
        "lsd"
        "bat"
        "eza"
        "zoxide"
        "starship"
        "ripgrep"
        "fd"
        "nano"
        "curl"
        "wget"
    )
    
    if command -v pacman &> /dev/null; then
        sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
    elif command -v apt &> /dev/null; then
        sudo apt update
        sudo apt install -y "${PACKAGES[@]}"
    else
        print_error "Gestor de paquetes no soportado"
        exit 1
    fi
    
    print_success "Paquetes instalados"
}

# Instalar zinit
install_zinit() {
    print_info "Instalando zinit..."
    
    if [ ! -d "$HOME/.local/share/zinit" ]; then
        bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
        print_success "Zinit instalado"
    else
        print_warning "Zinit ya está instalado"
    fi
}

# Crear enlaces simbólicos
create_symlinks() {
    print_info "Creando enlaces simbólicos..."
    
    # ZSH
    ln -sf "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
    mkdir -p "$HOME/.config/zsh"
    ln -sf "$DOTFILES_DIR/config/zsh/main.zsh" "$HOME/.config/zsh/main.zsh"
    ln -sf "$DOTFILES_DIR/config/zsh/plugins.zsh" "$HOME/.config/zsh/plugins.zsh"
    ln -sf "$DOTFILES_DIR/config/zsh/aliases.zsh" "$HOME/.config/zsh/aliases.zsh"
    ln -sf "$DOTFILES_DIR/config/zsh/custom.zsh" "$HOME/.config/zsh/custom.zsh"
    
    # Nano
    ln -sf "$DOTFILES_DIR/.nanorc" "$HOME/.nanorc"
    
    # Hyprland (si existe)
    if [ -f "$DOTFILES_DIR/config/hypr/hyprland.conf" ]; then
        mkdir -p "$HOME/.config/hypr"
        ln -sf "$DOTFILES_DIR/config/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"
    fi
    
    # Waybar (si existe)
    if [ -f "$DOTFILES_DIR/config/waybar/config" ]; then
        mkdir -p "$HOME/.config/waybar"
        ln -sf "$DOTFILES_DIR/config/waybar/config" "$HOME/.config/waybar/config"
        ln -sf "$DOTFILES_DIR/config/waybar/style.css" "$HOME/.config/waybar/style.css"
    fi
    
    # Kitty (si existe)
    if [ -f "$DOTFILES_DIR/config/kitty/kitty.conf" ]; then
        mkdir -p "$HOME/.config/kitty"
        ln -sf "$DOTFILES_DIR/config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
    fi
    
    # Starship
    if [ -f "$DOTFILES_DIR/config/starship.toml" ]; then
        ln -sf "$DOTFILES_DIR/config/starship.toml" "$HOME/.config/starship.toml"
    fi
    
    print_success "Enlaces simbólicos creados"
}

# Instalar temas de nano
install_nano_themes() {
    print_info "Instalando temas de nano..."
    
    mkdir -p "$HOME/.nano/themes"
    
    if [ ! -d "$HOME/.nano/themes/nanorc" ]; then
        git clone https://github.com/scopatz/nanorc.git "$HOME/.nano/themes/nanorc"
        print_success "Temas de nano instalados"
    else
        print_warning "Temas de nano ya instalados"
    fi
}

# Cambiar shell a zsh
change_shell() {
    print_info "Cambiando shell por defecto a zsh..."
    
    if [ "$SHELL" != "$(which zsh)" ]; then
        chsh -s "$(which zsh)"
        print_success "Shell cambiado a zsh (reinicia la sesión para aplicar)"
    else
        print_warning "Ya estás usando zsh"
    fi
}

# Crear directorios necesarios
create_directories() {
    print_info "Creando directorios necesarios..."
    
    mkdir -p "$HOME/.cache/zsh"
    mkdir -p "$HOME/.local/bin"
    mkdir -p "$HOME/Desarrollo"
    mkdir -p "$HOME/Descargas"
    mkdir -p "$HOME/Documentos"
    mkdir -p "$HOME/Pictures"
    
    print_success "Directorios creados"
}

# Main
main() {
    echo ""
    echo "╔════════════════════════════════════════╗"
    echo "║     DOTFILES INSTALLATION SCRIPT       ║"
    echo "╚════════════════════════════════════════╝"
    echo ""
    
    print_info "Iniciando instalación de dotfiles..."
    echo ""
    
    # Preguntar confirmación
    read -p "¿Deseas continuar con la instalación? (s/n): " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Ss]$ ]]; then
        print_error "Instalación cancelada"
        exit 1
    fi
    
    backup_configs
    install_packages
    install_zinit
    create_directories
    create_symlinks
    install_nano_themes
    change_shell
    
    echo ""
    print_success "¡Instalación completada!"
    echo ""
    print_info "Pasos siguientes:"
    echo "  1. Cierra esta terminal"
    echo "  2. Abre una nueva terminal"
    echo "  3. Ejecuta: source ~/.zshrc"
    echo ""
    print_warning "Si cambiaste el shell, necesitas cerrar sesión y volver a iniciar"
    echo ""
}

# Ejecutar
main