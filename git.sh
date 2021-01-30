#!/bin/bash
source $(dirname $0)/credentials.sh

commitMessage="Crontab $USER"
# gitFull = git pull && git add . && git commit -m "$commitMessage" && git push

paths=(
    ~/Pictures/wallpapers/wallpapers/paisagens
    ~/.config/Code/User
    ~/.vscode/extensions
    ~/.config/Insomnia
    ~/shellscripts/git
)

for path in ${paths[@]}; do
    echo $path
    cd $path $gitFull && git pull && git add . && git commit -m "$path" && git push
done
