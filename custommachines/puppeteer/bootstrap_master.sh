yum update -y 
yum install wget -y
wget https://s3.amazonaws.com/pe-builds/released/2019.0.2/puppet-enterprise-2019.0.2-el-7-x86_64.tar.gz
#https://pm.puppet.com/puppet-agent/2019.0.2/6.0.5/repos/el/7/puppet6/x86_64/puppet-agent-6.0.5-1.el7.x86_64.rpm
tar xf puppet-enterprise-2019.0.2-el-7-x86_64.tar.gz
echo "192.168.0.220 PMaster.home" >> /etc/hosts
echo "192.168.0.221 PAgentA" >> /etc/hosts
echo "192.168.0.221 PAgentB" >> /etc/hosts
cd puppet-enterprise-2019.0.2-el-7-x86_64
echo "\"console_admin_password\": \"password123\"" > pe.conf
echo "\"puppet_enterprise::puppet_master_host\": \"%{::trusted.certname}\"" >> pe.conf
./puppet-enterprise-installer -c pe.conf
puppet agent -t    
/opt/puppetlabs/server/bin/set_console_admin_password.rb 'Start!123'