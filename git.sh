#!/bin/bash
source $(dirname $0)/credentials.sh

commitMessage="Crontab $USER"

paths=(
    ~/Pictures/wallpapers/wallpapers/paisagens
    ~/.config/Code/User
    ~/.vscode/extensions
    ~/.config/Insomnia
    ~/.config/ulauncher
    ~/shellscripts/git
    ~/
)

for path in ${paths[@]}; do
    echo $path
    cd $path && git pull && git add . && git commit -m "$commitMessage" && git push
done
