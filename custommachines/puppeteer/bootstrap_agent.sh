yum update -y
yum install wget -y 
yum install nano -y 
echo "192.168.0.220 PMaster.home" >> /etc/hosts
curl -k /etc/puppetlabs/puppet/ssl/certs/ca.pem https://PMaster.home:8140/packages/current/install.bash | sudo bash