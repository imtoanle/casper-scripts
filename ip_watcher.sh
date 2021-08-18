#!/bin/bash

cd "${0%/*}"

public_ip="$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | tr -d '"')"

if [[ ! -z "$public_ip" ]] && [ -z "$(grep -rnw /etc/casper/*/config.toml -e "public_address = '$public_ip:0'")" ]
then
  fdfind config.toml /etc/casper/ -X sudo sed -i -E "s/public_address = '.+'/public_address = '$public_ip:0'/g"
  echo $(date +"%d/%m/%Y - %T"): Updated new IP $public_ip >> ./logs/ip_watcher.log
  sudo systemctl stop casper-node-launcher; sleep 2
  sudo logrotate -f /etc/logrotate.d/casper-node
  sudo systemctl start casper-node-launcher
fi

