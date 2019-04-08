sed -i -e 's/AuthorizedKeysFile/#AuthorizedKeysFile/g' /etc/ssh/sshd_config
echo "AuthorizedKeysFile /etc/ssh/authorized_keys" >> /etc/ssh/sshd_config
touch /etc/ssh/authorized_keys
cat /home/vagrant/.ssh/authorized_keys >> /etc/ssh/authorized_keys
systemctl restart sshd