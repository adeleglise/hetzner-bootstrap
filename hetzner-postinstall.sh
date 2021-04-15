#!/bin/bash
apt-get -y install byobu wget
mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://lab.radioking.io:infra/hetzner-bootstrap/ax41-proxmox/root-ssh-authorizedkeys.pub
bash < <(wget -qO - https://bit.ly/install-puppet-agent)
apt -y update  &&  apt upgrade -y && apt dist-upgrade -y
apt remove firmware-bnx2x firmware-realtek firmware-linux firmware-linux-free firmware-linux-nonfree
echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg
apt -y install proxmox-ve