#!/bin/bash
wget https://raw.github.com/adeleglise/hetzner-bootstrap/ax41-proxmox/hetzner-postinstall.sh
chmod 755 hetzner-postinstall.sh
echo "${SERVERNAME}" | egrep '^(([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9])\.)*([A-Za-z0-9]|[A-Za-z0-9][A-Za-z0-9\-]*[A-Za-z0-9])$' || VALIDHOSTNAME="false"
if [[ -n "$VALIDHOSTNAME" ]]; then
  echo "the provided SERVERNAME '${SERVERNAME}' is either invalid or empty"
  exit 1
else
  /root/.oldroot/nfs/install/installimage -a -p /boot:ext3:1G,lvm:vg0:all -v vg0:root:/:ext4:20G,lvm:vg0:all,vg0:swap:swap:swap:8G -r yes -l 1 -b grub -d nvme0n1,nvme1n1 -i /root/.oldroot/nfs/install/../images/Debian-109-buster-64-minimal.tar.gz -x hetzner-postinstall.sh -n ${SERVERNAME}
fi
