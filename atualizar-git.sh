#!/bin/bash
set -e  # Para o script parar em caso de erro

# Diretórios de configuração
CONFIG_DIRS=("swaync" "hypr" "pipewire" "gtk-3.0" "gtk-4.0" "rofi" "matugen" "wlogout" "kitty" "waybar" "Kvantum")

# Sincronizando diretórios
for dir in "${CONFIG_DIRS[@]}"; do
    rsync -av --delete $HOME/.config/$dir/ $HOME/Hyprland-Git/.config/$dir/
done

# Sincronizando arquivos individuais
for file in "$HOME/.zshrc" "$HOME/.zprofile" "$HOME/.gtkrc-2.0"; do
    rsync -av $file $HOME/Hyprland-Git/$(basename $file)
done

# Navegar para o diretório do repositório Git
cd $HOME/Hyprland-Git || { echo "Diretório não encontrado. Inicializando repositório..."; git init; }

# Verificar se há alterações não comitadas
if [[ -n $(git status -s) ]]; then
    echo "Há alterações não comitadas. Realizando stash..."
    git stash
fi

# Puxar mudanças do repositório remoto
git pull --rebase

# Verificar se há alterações após o pull
if [[ -n $(git status -s) ]]; then
    # Adicionar, commitar e enviar as alterações
    COMMIT_MSG="Atualizar arquivos de configuração - $(date '+%Y-%m-%d %H:%M:%S')"
    git add .
    git commit -m "$COMMIT_MSG"
    git push
    echo "Arquivos copiados, commit e push realizados com sucesso!"
else
    echo "Nenhuma alteração detectada para commit."
fi

# Se houve stash, aplicar as mudanças de volta
if git stash list | grep -q "stash@{0}"; then
    echo "Restaurando alterações com git stash pop..."
    git stash pop
fi
