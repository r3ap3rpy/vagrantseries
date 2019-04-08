wget https://networkgenomics.com/try/mitogen-0.2.6.tar.gz
tar -xvzf mitogen-0.2.6.tar.gz
mv mitogen-0.2.6 /etc/ansible/
sed -n -i 'p;10a strategy_plugins = /etc/ansible/mitogen-0.2.6/ansible_mitogen/plugins/strategy' /etc/ansible/ansible.cfg
sed -n -i 'p;11a strategy = mitogen_linear' /etc/ansible/ansible.cfg
