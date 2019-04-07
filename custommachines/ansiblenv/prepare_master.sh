yum install epel-release -y
yum install ansible -y


sed -i -e 's/#roles_path/roles_path/g' /etc/ansible/ansible.cfg
sed -i -e 's/#host_key_checking/host_key_checking/g' /etc/ansible/ansible.cfg
sed -i -e 's/#inventory/inventory/g' /etc/ansible/ansible.cfg

echo "[all]" > /etc/ansible/hosts
echo "AMaster" >> /etc/ansible/hosts
echo "centosA" >> /etc/ansible/hosts
echo "centosB" >> /etc/ansible/hosts
echo "raspberry" >> /etc/ansible/hosts
echo "reaperdome" >> /etc/ansible/hosts
echo "reaper" >> /etc/ansible/hosts
echo "" >> /etc/ansible/hosts
echo "[agents]" >> /etc/ansible/hosts
echo "centosA" >> /etc/ansible/hosts
echo "centosB" >> /etc/ansible/hosts
echo "raspberry" >> /etc/ansible/hosts
echo "" >> /etc/ansible/hosts
echo "" >> /etc/ansible/hosts
echo "[centos]" >> /etc/ansible/hosts
echo "centosA" >> /etc/ansible/hosts
echo "centosB" >> /etc/ansible/hosts	
echo "rhel" >> /etc/ansible/hosts	
echo "AMaster" >> /etc/ansible/hosts	
echo "" >> /etc/ansible/hosts
echo "[master]" >> /etc/ansible/hosts
echo "AMaster" >> /etc/ansible/hosts
echo "" >> /etc/ansible/hosts
echo "[dc]" >> /etc/ansible/hosts
echo "reaperdome" >> /etc/ansible/hosts
echo "" >> /etc/ansible/hosts
echo "[win]" >> /etc/ansible/hosts
echo "reaper" >> /etc/ansible/hosts

echo "192.168.0.190 AMaster" >> /etc/hosts
echo "192.168.0.191 centosA" >> /etc/hosts
echo "192.168.0.192 centosB" >> /etc/hosts
echo "192.168.0.150 raspberry" >> /etc/hosts
echo "192.168.0.200 reaperdome" >> /etc/hosts
echo "192.168.0.201 reaper" >> /etc/hosts
echo "192.168.0.210 rhel" >> /etc/hosts