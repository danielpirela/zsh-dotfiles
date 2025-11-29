# ============================================
# CONFIGURACIÓN PRINCIPAL
# ============================================

# Historial
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# Autocompletado
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# Estilos de completado
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

# Opciones generales
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt CORRECT
setopt EXTENDED_GLOB
setopt NO_BEEP

# Keybindings (modo vi)
bindkey -v
export KEYTIMEOUT=1

# Keybindings útiles
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# FZF keybindings (cargar después de inicializar FZF)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh


# Variables de entorno
export EDITOR="nano"
export VISUAL="nano"
export PAGER="less"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Colores
autoload -U colors && colors

# Path
export PATH="$HOME/.local/bin:$PATH"

# Inicializar herramientas modernas
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# FZF configuración
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border
  --inline-info
  --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
  --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
  --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
  --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
"

#Vs code zsh path

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

