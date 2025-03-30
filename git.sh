#!/bin/bash
source $(dirname $0)/credentials.sh

commitMessage="Crontab $USER"
#sudo chmod 777 -R /etc/apache2/sites-available/.git

paths=(
    ~/Pictures/wallpapers/wallpapers/paisagens
    # ~/.config/Code/User
    # ~/.vscode/extensions
    # ~/.config/Insomnia
    ~/.config/ulauncher
    ~/.local/share/DBeaverData
    ~/atalhos
    ~/shellscripts/git
    ~/shellscripts/DotFiles
    # ~/shellscripts/pc-.zshrc
    ~/shellscripts/gitconfig
    ~/shellscripts/scriptsToRun
    # ~/.local/share/nautilus/scripts # não lembro o que é
    # ~/vpns
    ~/shellscripts/changeWallpaper
    # /var/www/html/nginx
    # ~/shellscripts/slackbot
)

runScripts=(
    ~/shellscripts/scriptsToRun/gitconfig/run.sh
)


printf "****************** Rodando scripts ******************\\n\\n"
for scrip in ${runScripts[@]}; do
    $scrip
    printf "\\n---------------------------------------------------------------\\n"
done
printf "****************** Fim Rodando scripts ******************\\n\\n"




for path in ${paths[@]}; do
    #clear
    printf "**************************** $path ****************************\\n\\n"
    if [ "$path" = ~/shellscripts/pc-.zshrc ]; then
        echo "run script"
        $path/run.sh
    fi

    cd $path && git add . && git commit -m "$commitMessage" && git pull && git push
    
    printf "\\n\\n********** Resolvendo conflitos aceitando sempre as entradas **********\\n"
    cd $path && git checkout --theirs . && git pull && git add . && git commit -m "$commitMessage" && git pull && git push
    
    # Se você está no meio de um merge e quer abortá-lo para começar de novo, você pode usar:
    # git merge --abort
    
    # Faça um pull com a estratégia ours para manter todas as suas alterações locais e não trazer nenhuma alteração remota para os arquivos que estão em conflito:
    # git pull -s ours
    
    # Se você deseja usar a versão remota em vez da local, use a estratégia theirs:
    # git pull -s theirs

    printf "\\n-------------------------------------------------------------------------------------------------\\n"

done
