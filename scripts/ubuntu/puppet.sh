#!/bin/bash
set -ex

sudo chown root:root /tmp/puppetlabs.gpg
sudo mv /tmp/puppetlabs.gpg /etc/apt/trusted.gpg.d

sudo chown root:root /tmp/puppetlabs.list
sudo mv /tmp/puppetlabs.list /etc/apt/sources.list.d

sudo apt-get -y update
sudo apt-get -y install puppet
