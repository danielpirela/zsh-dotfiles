# 🚀 Mis Dotfiles

Configuración personal para Arch Linux con Hyprland, Zsh y herramientas modernas.

## 📦 Incluye

- **Zsh** con configuración modular
- **Nano** con temas y números de línea
- **Hyprland** compositor Wayland
- **Waybar** barra de estado
- **Starship** prompt moderno
- **FZF, LSD, BAT, EZA** y más herramientas CLI

## 🛠️ Instalación

### Instalación automática
```bash
git clone https://github.com/TU_USUARIO/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

### Instalación manual

1. Clonar el repositorio:
```bash
git clone https://github.com/TU_USUARIO/dotfiles.git ~/dotfiles
```

2. Crear enlaces simbólicos:
```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.nanorc ~/.nanorc
mkdir -p ~/.config/zsh
ln -sf ~/dotfiles/config/zsh/* ~/.config/zsh/
```

3. Instalar dependencias:
```bash
sudo pacman -S zsh git fzf lsd bat eza zoxide starship ripgrep fd nano
```

4. Cambiar shell:
```bash
chsh -s $(which zsh)
```

## 📁 Estructura
```
dotfiles/
├── .zshrc                  # Archivo principal de zsh
├── .nanorc                 # Configuración de nano
├── config/
│   ├── zsh/
│   │   ├── main.zsh       # Configuración principal
│   │   ├── plugins.zsh    # Plugins
│   │   ├── aliases.zsh    # Aliases
│   │   └── custom.zsh     # Funciones personalizadas
│   ├── hypr/
│   │   └── hyprland.conf  # Configuración de Hyprland
│   ├── waybar/
│   │   ├── config         # Configuración de Waybar
│   │   └── style.css      # Estilos de Waybar
│   ├── kitty/
│   │   └── kitty.conf     # Configuración de Kitty
│   └── starship.toml      # Prompt Starship
├── scripts/               # Scripts útiles
├── install.sh             # Script de instalación
└── README.md              # Este archivo
```

## ⚡ Características

### Zsh
- Configuración modular y organizada
- Plugins con zinit
- Autocompletado inteligente
- Historial compartido
- Syntax highlighting
- Autosugerencias

### Nano
- Números de línea
- Syntax highlighting
- Colores personalizados
- Atajos mejorados

### Herramientas CLI
- `lsd` - ls mejorado
- `bat` - cat con syntax highlighting
- `fzf` - búsqueda difusa
- `zoxide` - cd inteligente
- `eza` - ls alternativo
- `ripgrep` - búsqueda en archivos
- `fd` - búsqueda de archivos

## 🔧 Personalización

Edita los archivos en `~/dotfiles/config/` y los cambios se reflejarán automáticamente gracias a los enlaces simbólicos.

## 📝 Actualización
```bash
cd ~/dotfiles
git pull
```

## 🔄 Restaurar backup

Si algo sale mal, tus configuraciones antiguas están en:
```bash
~/.dotfiles_backup_FECHA/
```

## 📸 Screenshots

[Agregar capturas de pantalla aquí]

## 📜 Licencia

MIT License

## 👤 Autor

Daniel - [@danielpirela](https://github.com/danielpirela)