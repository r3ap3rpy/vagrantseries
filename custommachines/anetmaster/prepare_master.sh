yum install epel-release -y
yum install ansible -y

sed -i -e 's/#roles_path/roles_path/g' /etc/ansible/ansible.cfg
sed -i -e 's/#host_key_checking/host_key_checking/g' /etc/ansible/ansible.cfg
sed -i -e 's/#inventory/inventory/g' /etc/ansible/ansible.cfg

echo "[cisco]" > /etc/ansible/hosts
echo "ciscoiosc3745" >> /etc/ansible/hosts
echo "ciscoiosc7200" >> /etc/ansible/hosts

echo "172.28.128.50 ciscoiosc3745" >> /etc/hosts
echo "172.28.128.51 ciscoiosc7200" >> /etc/hosts


mkdir -p /etc/ansible/group_vars

echo "---" > /etc/ansible/group_vars/cisco.yaml
echo "ansible_ssh_user: ansible" >> /etc/ansible/group_vars/cisco.yaml
echo "ansible_ssh_pass: ansible" >> /etc/ansible/group_vars/cisco.yaml
echo "ansible_connection: network_cli" >> /etc/ansible/group_vars/cisco.yaml
echo "ansible_network_os: ios" >> /etc/ansible/group_vars/cisco.yaml
