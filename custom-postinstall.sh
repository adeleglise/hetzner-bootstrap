apt -y update  &&  apt upgrade -y && apt dist-upgrade -y
apt remove firmware-bnx2x firmware-realtek firmware-linux firmware-linux-free firmware-linux-nonfree
echo "deb http://download.proxmox.com/debian/pve buster pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg -O /etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg
apt -y install proxmox-ve