# ============================================
# CONFIGURACIÓN PRINCIPAL DE ZSH
# ============================================

# Directorio de configuración
export ZDOTDIR="$HOME/.config/zsh"

# Cargar configuraciones modulares
source "$ZDOTDIR/main.zsh"
source "$ZDOTDIR/plugins.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/custom.zsh"

# Spaceship prompt
source /usr/lib/spaceship-prompt/spaceship.zsh
