#Start!123
useradd -m -p '$6$bBpQeAuWbmSW$hGjS1siMXh81Lx6kgyZUfma8Cg66bhXSF1RnjXK/6iaubO9DSE9NlyTIxo4eqhTetWApY0Wj3j3xXUxFNqEfh1' -s /bin/bash $1
usermod -a -G wheel $1  
echo "$1  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
sudo -u $1 ssh-keygen -t rsa -b 2048 -f /home/$1/.ssh/$(hostname) -q -N ""
cp -f /home/$1/.ssh/$(hostname) /fdrive/keys/
cp -f /home/$1/.ssh/$(hostname).pub /fdrive/keys/$(hostname).pub
echo "Host *" > /home/$1/.ssh/config
echo "    IdentityFile /home/$1/.ssh/$(hostname)" >> /home/$1/.ssh/config
chown $1.$1 /home/$1/.ssh/config
chmod 600 /home/$1/.ssh/config
cat /home/$1/.ssh/$(hostname).pub >> /etc/ssh/authorized_keys
