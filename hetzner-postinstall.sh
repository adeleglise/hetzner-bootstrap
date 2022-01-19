#!/bin/bash
apt-get -y install byobu wget
mkdir /root/.ssh
chmod 700 /root/.ssh
wget -O /root/.ssh/authorized_keys https://raw.github.com/adeleglise/hetzner-bootstrap/ax41-proxmox/root-ssh-authorizedkeys.pub
bash < <(wget -qO - https://bit.ly/install-puppet-agent)
apt -y update && apt upgrade -y && apt dist-upgrade -y
apt -y remove firmware-bnx2x firmware-realtek firmware-linux firmware-linux-free firmware-linux-nonfree
echo "deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg
apt update && apt full-upgrade -y
apt remove os-prober -y
echo "samba-common samba-common/workgroup string  WORKGROUP" | debconf-set-selections
echo "samba-common samba-common/dhcp boolean false" | debconf-set-selections
echo "samba-common samba-common/do_debconf boolean true" | debconf-set-selections
echo "postfix postfix/mailname string ${SERVERNAME}" | debconf-set-selections
echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections
apt -y install proxmox-ve open-iscsi ifupdown2