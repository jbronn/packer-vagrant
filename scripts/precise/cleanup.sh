#!/bin/bash
set -ex

# Remove any Linux kernel packages that we aren't using to boot.
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

# Clean out any cached interfaces.
sudo rm -f /etc/udev/rules.d/70-persistent-net.rules

# Clean out apt cache, lists, and autoremove any packages.
sudo rm -f /var/lib/apt/lists/lock
sudo rm -f /var/lib/apt/lists/*_*
sudo rm -f /var/lib/apt/lists/partial/*
sudo apt-get -y autoremove
sudo apt-get -y clean

# Remove logs from initialization.
sudo rm -f /var/log/*.log /var/log/*.gz /var/log/dmesg*
sudo rm -fr /var/log/syslog /var/log/upstart/*.log /var/log/{b,w}tmp /var/log/udev

# Get rid of bash history.
sudo rm -f $HOME/.bash_history

# Zero out empty sectors with sfill -- this would be much
# faster with zerofree, but would require a custom-compiled
# version of Packer, thus we stick with something that's
# slower, but stock.
sudo sfill -f -l -l -z /
