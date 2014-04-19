#!/bin/sh
set -e

# Add vagrant user file to /etc/sudoers.d
echo "%vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

# APT settings, and package upgrades.
sed -i /^deb-src/d /etc/apt/sources.list
export DEBIAN_FRONTEND=noninteractive
export APT_LISTBUGS_FRONTEND=none
export APT_LISTCHANGES_FRONTEND=none
apt-get -y update
apt-get -y -o DPkg::Options="--force-confold" upgrade
apt-get -y install linux-virtual

# Remove this script.
rm /tmp/postinstall.sh
exit 0
