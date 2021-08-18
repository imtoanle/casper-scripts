# casper-tools

## Download scripts
```
git clone git@github.com:imtoanle/casper-scripts.git
cd casper-scripts
chmod +x ./ip_watcher.sh
```

## Install Crontab
```
crontab -e
```
### Add cron
```
  */10 * * * * /home/lxc/casper-scripts/ip_watcher.sh
```
