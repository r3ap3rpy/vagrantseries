useradd -m -p '$6$AcOyr0G7bp0w72KD$lxsN/PekbvP4QpfUtSeEemon4fmf49zyYj5X0ITf0NTB67t9AvjIJ54i1AhQ8srq.wUGI34qIdJtSmGXZff4E/' -s /bin/bash r3ap3rpy
usermod -a -G wheel r3ap3rpy 
mkdir -p /home/r3ap3rpy/.ssh
cp /fdrive/DevOps/Vagrant/ssh_keys/r3ap3rpy/* /home/r3ap3rpy/.ssh/
cat /home/r3ap3rpy/.ssh/ds_id_rsa.pub > /home/r3ap3rpy/.ssh/authorized_keys
chown r3ap3rpy.r3ap3rpy -R /home/r3ap3rpy/.ssh
chmod 400 /home/r3ap3rpy/.ssh/id_rsa