#!/bin/bash
# SSH key (bereits da)
# Sudoers für dfu-util und systemctl klipper
echo "pi ALL=(ALL) NOPASSWD: /usr/bin/dfu-util, /bin/systemctl stop klipper, /bin/systemctl start klipper, /usr/bin/systemctl stop klipper, /usr/bin/systemctl start klipper" > /tmp/klipper_flash_sudo
cp /tmp/klipper_flash_sudo /etc/sudoers.d/klipper_flash
chmod 440 /etc/sudoers.d/klipper_flash
echo "Sudoers gesetzt"
