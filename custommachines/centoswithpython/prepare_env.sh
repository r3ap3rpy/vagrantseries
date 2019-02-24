yum update -y
yum groupinstall 'Development Tools' -y
yum install nano wget gcc openssl-devel bzip2-devel libffi libffi-devel -y
wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
tar xzf Python-3.7.0.tgz
cd Python-3.7.0
./configure --enable-optimizations
make altinstall
cd ..
rm -rf Python-3.7.0
rm -f Python-3.7.0.tgz
update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.7 1
echo "1"|update-alternatives --config python3
unlink /usr/bin/python 
ln -s /usr/local/bin/pip3.7 /usr/bin/pip
ln -s /usr/local/bin/python3.7 /usr/bin/python
pip install --upgrade pip
pip install virtualenv

wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
cat authorized_keys >> /etc/sshd/authorized_keys