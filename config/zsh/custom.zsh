# ============================================
# FUNCIONES PERSONALIZADAS
# ============================================

# Extraer archivos comprimidos
ex() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *)           echo "'$1' no puede ser extraído" ;;
    esac
  else
    echo "'$1' no es un archivo válido"
  fi
}

# Crear directorio y entrar en él
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Buscar en el historial
h() {
  if [ -z "$1" ]; then
    history
  else
    history | grep "$1"
  fi
}

# Buscar archivos por nombre
ff() {
  fd -H -I "$1"
}

# Buscar en archivos por contenido
rg() {
  command rg --color=always --line-number --no-heading --smart-case "$@" | less -R
}

# CD mejorado con zoxide
cd() {
  z "$@"
}

# Listar archivos después de cd
chpwd() {
  lsd -la
}

# Backup rápido de archivos
backup() {
  cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
}

# Crear archivo y directorio si no existe
touchp() {
  mkdir -p "$(dirname "$1")" && touch "$1"
}

# Git commit y push rápido
gcap() {
  git add -A && git commit -m "$1" && git push
}

# Mostrar los 10 comandos más usados
top10() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head -10
}

# Información del sistema
sysinfo() {
  echo "=== Información del Sistema ==="
  echo "Hostname: $(hostname)"
  echo "Kernel: $(uname -r)"
  echo "Uptime: $(uptime -p)"
  echo "CPU: $(lscpu | grep 'Model name' | cut -d':' -f2 | xargs)"
  echo "RAM: $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
  echo "Disco: $(df -h / | awk 'NR==2 {print $3 "/" $2 " (" $5 " usado)"}')"
}

# Generar contraseña aleatoria
genpass() {
  local length=${1:-16}
  openssl rand -base64 48 | cut -c1-$length
}

# Listar procesos que más consumen CPU
topcpu() {
  ps aux --sort=-%cpu | head -10
}

# Listar procesos que más consumen RAM
topmem() {
  ps aux --sort=-%mem | head -10
}

# Convertir video a GIF
vid2gif() {
  ffmpeg -i "$1" -vf "fps=10,scale=720:-1:flags=lanczos" -c:v gif "$2"
}

# Comprimir directorio
compress() {
  tar -czf "$1.tar.gz" "$1"
}

# Servidor HTTP simple
serve() {
  local port=${1:-8000}
  python -m http.server "$port"
}

# Actualizar todo el sistema
updateall() {
  echo "Actualizando sistema..."
  sudo pacman -Syu
  echo "Actualizando flatpak..."
  flatpak update -y
  echo "Limpiando cache..."
  sudo pacman -Sc --noconfirm
  echo "✅ Sistema actualizado"
}


# Git clone y cd automático
gclone() {
  if [ -z "$1" ]; then
    echo "Uso: gclone <url> [nombre_directorio]"
    return 1
  fi
  
  # Si se proporciona un nombre de directorio
  if [ -n "$2" ]; then
    git clone "$1" "$2" && cd "$2"
  else
    # Extraer el nombre del repo de la URL
    local repo_name=$(basename "$1" .git)
    git clone "$1" && cd "$repo_name"
  fi
}

