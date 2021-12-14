#!/bin/bash
source $(dirname $0)/credentials.sh

commitMessage="Crontab $USER"
#sudo chmod 777 -R /etc/apache2/sites-available/.git

paths=(
    ~/Pictures/wallpapers/wallpapers/paisagens
    ~/.config/Code/User
    ~/.vscode/extensions
    ~/.config/Insomnia
    ~/.config/ulauncher
    ~/atalhos
    ~/shellscripts/git
    ~/shellscripts/DotFiles
    /etc/apache2/sites-available
    ~/
)

for path in ${paths[@]}; do
    echo $path
    cd $path && git pull && git add . && git commit -m "$commitMessage" && git push
done
