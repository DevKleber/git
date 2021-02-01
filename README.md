# Git 

Synchronizing my **settings** and **programs**


## Path on pc

~/shellscripts/git

  

## setting crontab

### Execute Cron Job After System Reboot
```sh
@reboot ~/shellscripts/git/git.sh
```

### Setting Cron Job at  every minute  past every 5th hour.
```sh
* */5 * * * ~/shellscripts/git/git.sh
```

```sh 
git remote add origin url
git pull origin master --allow-unrelated-histories
git branch --set-upstream-to origin/master
```