# ============================================
# ALIASES
# ============================================

# Comandos básicos mejorados
alias ls='lsd'
alias l='lsd -la'
alias ll='lsd -l'
alias la='lsd -a'
alias lt='lsd --tree'
alias cat='bat'
alias c='clear'

# Navegación
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# Git
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias glg='git log --graph --oneline --decorate --all'
alias glog='git log --oneline --decorate --graph'
# Git clone aliases
alias gcl='gclone'
alias gcd='git clone --depth=1'  # Clone shallow (más rápido)
# Pacman / Yay
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias search='pacman -Ss'
alias clean='sudo pacman -Sc'
alias orphan='sudo pacman -Rns $(pacman -Qtdq)'

# Yay (si lo tienes instalado)
alias yup='yay -Syu'
alias yin='yay -S'
alias yre='yay -Rns'

# Systemctl
alias sc='sudo systemctl'
alias scs='systemctl status'
alias sce='sudo systemctl enable'
alias scd='sudo systemctl disable'
alias scr='sudo systemctl restart'

# Utilidades
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ps='ps auxf'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'
alias wget='wget -c'
alias histg='history | grep'
#alias myip='curl ifconfig.me'
alias ports='netstat -tulanp'

# Funciones útiles
alias extract='ex'
alias weather='curl wttr.in'
alias cheat='cht.sh'

# Hyprland (si lo usas)
alias hypr='nano ~/.config/hypr/hyprland.conf'
alias wayb='nano ~/.config/waybar/config'

# Editar configs
alias zshrc='nano ~/.zshrc'
alias zshmain='nano ~/.config/zsh/main.zsh'
alias zshalias='nano ~/.config/zsh/aliases.zsh'
alias zshplug='nano ~/.config/zsh/plugins.zsh'
alias zshcust='nano ~/.config/zsh/custom.zsh'

# Recargar zsh
alias reload='source ~/.zshrc'

# Recursos del sistema
alias cpu='top -o %CPU'
alias mem='top -o %MEM'

# Tiempo
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'

# Listar solo directorios
alias lsd='lsd -d */'

# Colorear salidas
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# Quick cd
alias dev='pnpm run dev'
alias doc='cd ~/Documentos'
alias down='cd ~/Downloads'
