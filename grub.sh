#!/bin/bash
vgcreate newVG /dev/sdc /dev/sdd /dev/sde
lvcreate -n newLG -L 300MB newVG
vgrename newVG OtusVG
lvrename OtusVG newLG OtusLG
sed -i s'/GRUB_TIMEOUT_STYLE=hidden/#GRUB_TIMEOUT_STYLE=hidden/' /etc/default/grub
sed -i s'/GRUB_TIMEOUT=0/GRUB_TIMEOUT=10/' /etc/default/grub.d/50-cloudimg-settings.cfg
update-grub
reboot