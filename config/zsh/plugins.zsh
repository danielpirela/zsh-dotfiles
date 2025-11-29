# ============================================
# PLUGINS CON ZINIT
# ============================================

# Cargar zinit

if [[ ! -f "${HOME}/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
    echo "Zinit no está instalado. Instalando..."
    bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"

# Tema Starship (más rápido que spaceship)
# Si prefieres spaceship, descomenta las siguientes líneas:
# zinit ice depth=1
# zinit light spaceship-prompt/spaceship-prompt

# Autosugerencias (sugiere comandos mientras escribes)
zinit light zsh-users/zsh-autosuggestions

# Syntax highlighting (resalta comandos)
zinit light zsh-users/zsh-syntax-highlighting

# Completados adicionales
zinit light zsh-users/zsh-completions

# History substring search (buscar en historial con flechas)
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Autosugerencias de comandos populares
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# Fast syntax highlighting (más rápido)
zinit light zdharma-continuum/fast-syntax-highlighting

# Autopair (cierra paréntesis, comillas, etc)
zinit light hlissner/zsh-autopair

# You should use (te recuerda usar alias)
zinit light MichaelAquilina/zsh-you-should-use

# Auto notify (notifica cuando termina un comando largo)
zinit light MichaelAquilina/zsh-auto-notify
AUTO_NOTIFY_THRESHOLD=30
AUTO_NOTIFY_TITLE="✅ Command completed"

# FZF tab completion
zinit light Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Direnv (carga variables de entorno por directorio)
# zinit light ptavares/zsh-direnv

# Git extras
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh
zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
