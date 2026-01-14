#!/bin/bash

# Copiar arquivos de configuração para a pasta do repositório Git
cp -r ~/.config/swaync ~/Hyprland-Git/.config/swaync
cp -r ~/.config/hypr ~/Hyprland-Git/.config/hypr
cp -r ~/.config/pipewire ~/Hyprland-Git/.config/pipewire
cp -r ~/.config/gtk-3.0 ~/Hyprland-Git/.config/gtk-3.0
cp -r ~/.config/gtk-4.0 ~/Hyprland-Git/.config/gtk-4.0
cp -r ~/.config/rofi ~/Hyprland-Git/.config/rofi
cp -r ~/.config/matugen ~/Hyprland-Git/.config/matugen
cp -r ~/.config/wlogout ~/Hyprland-Git/.config/wlogout
cp -r ~/.config/kitty ~/Hyprland-Git/.config/kitty
cp -r ~/.config/waybar ~/Hyprland-Git/.config/waybar
cp -r ~/.config/Kvantum ~/Hyprland-Git/.config/Kvantum

cp ~/.zshrc ~/Hyprland-Git/.zshrc
cp ~/.zprofile ~/Hyprland-Git/.zprofile
cp ~/.gtkrc-2.0 ~/Hyprland-Git/.gtkrc-2.0

# Navegar para o diretório do repositório Git
cd ~/Hyprland-Git || exit

# Adicionar os arquivos modificados ao Git
git add .

# Criar um commit com uma mensagem padrão (você pode personalizar a mensagem conforme necessário)
git commit -m "Atualizar arquivos de configuração"

# Enviar as mudanças para o repositório remoto
git push

# Exibir mensagem de conclusão
echo "Arquivos copiados, commit e push realizados com sucesso!"