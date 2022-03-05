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
    ~/.local/share/DBeaverData
    ~/atalhos
    ~/shellscripts/git
    ~/shellscripts/DotFiles
    ~/shellscripts/pc-.zshrc
    ~/shellscripts/scriptsToRun
    ~/.local/share/nautilus/scripts
    /etc/apache2/sites-available
    ~/
)

for path in ${paths[@]}; do
    echo $path
    if [ "$path" = ~/shellscripts/pc-.zshrc ]; then
        echo "run script"
        $path/run.sh
    fi

    cd $path && git add . && git commit -m "$commitMessage" && git pull && git push
    # Git : accept all incoming changes
    cd $path && git checkout --theirs . && git add . && git commit -m "$commitMessage" && git pull && git push

done
