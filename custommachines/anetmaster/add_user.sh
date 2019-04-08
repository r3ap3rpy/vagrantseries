useradd -m -p '$6$V.zuYRsYC8/oVunA$YahtpLCiG/u5u/c7JE.euOLmb7m0lKUoh9xsBwhODVy7rBM6hAAgkx.cFroh5O4XR6ZHv.4cJ0mkx7I71lX0l/' -s /bin/bash $1
usermod -a -G wheel $1  
echo "$1  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sudo -u $1 ssh-keygen -t rsa -b 2048 -f /home/$1/.ssh/$(hostname) -q -N ""
cp -f /home/$1/.ssh/$(hostname) /fdrive/Vagrant/keys/
cp -f /home/$1/.ssh/$(hostname).pub /fdrive/Vagrant/keys/$(hostname).pub
cat /fdrive/Vagrant/keys/id_rsa.pub >> /etc/ssh/authorized_keys
echo "Host *" > /home/$1/.ssh/config
echo "    IdentityFile /home/$1/.ssh/$(hostname)" >> /home/$1/.ssh/config
chown $1.$1 /home/$1/.ssh/config
chmod 600 /home/$1/.ssh/config
