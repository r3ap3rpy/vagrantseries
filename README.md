# Welcome to my vagrant repository

This repository holds the support files for my corresponding course on Udemy.

This is the [link](https://app.vagrantup.com/r3ap3rpy) for the vagrant boxes I have.

There are many folders in this repo which correspond to a video.

All you need to do to get started with the course is to install vagrant and the hyper-v on a windows 10 machine, later you will need virtual box too.


Some vagrant commands which are needed:
 - vagrant up
 - vagrant suspend 
 - vagrant resume
 - vagrant reload
 - vagrant destroy


To disable default mount of SMB shares use this.

```bash
configure.vm.synced_folder ".", "/vagrant", disabled: true
```

To configure timeout on windows use this.

```bash
net config server /autodisconnect:-1
```

Custom provision commands.

```bash
vagrant provision --provision-with shell
vagrant up --provision-with=chef
vagrant up --no-provision
```

Commands for multimachine vagrants.

```bash
vagrant reload web db
vagrant status web
vagrant ssh web
```

Commands to prepare box packaging.

```bash
apt-get update && apt-get upgrade -y
apt-get install sudo

#guest addons
apt install build-essential dkms linux-headers-$(uname -r)
mkdir /media/cdrom
mount /dev/cdrom /media/cdrom

visudo
#vagrant ALL=(ALL) NOPASSWD:ALL


mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
```

To package a prepared VM.

```bash
vagrant package --base nameofvm
```