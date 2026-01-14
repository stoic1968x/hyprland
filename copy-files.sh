#!/bin/bash

# Usar rsync para copiar arquivos e diretórios
rsync -av --delete ~/.config/swaync/ ~/Hyprland-Git/.config/swaync/
rsync -av --delete ~/.config/hypr/ ~/Hyprland-Git/.config/hypr/
rsync -av --delete ~/.config/pipewire/ ~/Hyprland-Git/.config/pipewire/
rsync -av --delete ~/.config/gtk-3.0/ ~/Hyprland-Git/.config/gtk-3.0/
rsync -av --delete ~/.config/gtk-4.0/ ~/Hyprland-Git/.config/gtk-4.0/
rsync -av --delete ~/.config/rofi/ ~/Hyprland-Git/.config/rofi/
rsync -av --delete ~/.config/matugen/ ~/Hyprland-Git/.config/matugen/
rsync -av --delete ~/.config/wlogout/ ~/Hyprland-Git/.config/wlogout/
rsync -av --delete ~/.config/kitty/ ~/Hyprland-Git/.config/kitty/
rsync -av --delete ~/.config/waybar/ ~/Hyprland-Git/.config/waybar/
rsync -av --delete ~/.config/Kvantum/ ~/Hyprland-Git/.config/Kvantum/

rsync -av ~/.zshrc ~/Hyprland-Git/.zshrc
rsync -av ~/.zprofile ~/Hyprland-Git/.zprofile
rsync -av ~/.gtkrc-2.0 ~/Hyprland-Git/.gtkrc-2.0

# Navegar para o diretório do repositório Git
cd ~/Hyprland-Git || exit

# Adicionar os arquivos modificados ao Git
git add .

# Criar um commit com uma mensagem padrão
git commit -m "Atualizar arquivos de configuração"

# Enviar as mudanças para o repositório remoto
git push

# Exibir mensagem de conclusão
echo "Arquivos copiados, commit e push realizados com sucesso!"
