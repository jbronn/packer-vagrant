packer-vagrant
==============

This repository houses [Packer](http://packer.io) templates for bare-bones
Vagrant boxes for use with Puppet.  The [JeOS](http://en.wikipedia.org/wiki/Just_enough_operating_system)
philosophy is used -- the boxes have a minimal set of packages installed
(Puppet and virtualization extensions, primarily).

precise64
---------

This template creates a minimal 64-bit Ubuntu 12.04 base box for VirtualBox.
To generate `precise64.box`, simply run:

```
$ packer build precise64.json
```

Some notes:

* The box is up-to-date with security and kernel updates upon generation.
* Puppet is installed from the [Puppet Labs apt](http://apt.puppetlabs.com/) repository.
* It uses the 12.04.1 ISO image so that the [`linux-virtual`](https://help.ubuntu.com/community/ServerFaq#What_are_the_differences_between_the_server_and_virtual_kernels.3F) kernel may be used.
* The `apt` lists are must be restored on first use (they take up space and can go stale if included).
