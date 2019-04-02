yum update -y
yum groupinstall "Development Tools" -y
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y 

echo "[rabbitmq-erlang]"> /etc/yum.repos.d/rabbitmq-erlang.repo
echo "name=rabbitmq-erlang">> /etc/yum.repos.d/rabbitmq-erlang.repo
echo "baseurl=https://dl.bintray.com/rabbitmq/rpm/erlang/20/el/7">> /etc/yum.repos.d/rabbitmq-erlang.repo
echo "gpgcheck=1">> /etc/yum.repos.d/rabbitmq-erlang.repo
echo "gpgkey=https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc">> /etc/yum.repos.d/rabbitmq-erlang.repo
echo "repo_gpgcheck=0">> /etc/yum.repos.d/rabbitmq-erlang.repo
echo "enabled=1">> /etc/yum.repos.d/rabbitmq-erlang.repo

yum -y install centos-release-scl centos-release-scl-rh wget nano
yum -y install policycoreutils-python
yum install https://dl.bintray.com/rabbitmq/all/rabbitmq-server/3.7.5/rabbitmq-server-3.7.5-1.el7.noarch.rpm -y
yum install rh-postgresql10 memcached rh-python36 -y
yum -y install --disablerepo='*' --enablerepo='mrmeee-ansible-awx, base' -x *-debuginfo rh-python36*
wget -O /etc/yum.repos.d/awx-rpm.repo https://copr.fedorainfracloud.org/coprs/mrmeee/awx/repo/epel-7/mrmeee-awx-epel-7.repo

yum install -y awx

semanage port -a -t http_port_t -p tcp 8051
semanage port -a -t http_port_t -p tcp 8052
setsebool -P httpd_can_network_connect 1

scl enable rh-postgresql10 "postgresql-setup initdb"

systemctl enable rabbitmq-server
systemctl enable rh-postgresql10-postgresql.service
systemctl enable memcached

systemctl start rabbitmq-server
systemctl start rh-postgresql10-postgresql.service
systemctl start memcached

scl enable rh-postgresql10 "su postgres -c \"createuser -S awx\""
scl enable rh-postgresql10 "su postgres -c \"createdb -O awx awx\""

sudo -u awx scl enable rh-python36 rh-postgresql10 "/opt/awx/bin/awx-manage migrate"

echo "from django.contrib.auth.models import User; User.objects.create_superuser('admin', 'root@localhost', 'password')" | sudo -u awx scl enable rh-python36 rh-postgresql10 "/opt/awx/bin/awx-manage shell"

sudo -u awx scl enable rh-python36 rh-postgresql10 "/opt/awx/bin/awx-manage create_preload_data"
sudo -u awx scl enable rh-python36 rh-postgresql10 "/opt/awx/bin/awx-manage provision_instance --hostname=$(hostname)"
sudo -u awx scl enable rh-python36 rh-postgresql10 "/opt/awx/bin/awx-manage register_queue --queuename=tower --hostnames=$(hostname)"

yum -y install nginx
wget -O /etc/nginx/nginx.conf https://raw.githubusercontent.com/MrMEEE/awx-build/master/nginx.conf
sed -n -i 'p;38a server { listen      80; return 301 http://$host:8052$request_uri; }' /etc/nginx/nginx.conf
systemctl enable nginx
systemctl start nginx

systemctl start awx-cbreceiver
systemctl start awx-dispatcher
systemctl start awx-channels-worker
systemctl start awx-daphne
systemctl start awx-web

systemctl enable awx-cbreceiver
systemctl enable awx-dispatcher
systemctl enable awx-channels-worker
systemctl enable awx-daphne
systemctl enable awx-web

systemctl status awx-cbreceiver
systemctl status awx-dispatcher
systemctl status awx-channels-worker
systemctl status awx-daphne
systemctl status awx-web

scl enable rh-python36 "virtualenv /var/lib/awx/venv/ansible2.7.8"
scl enable rh-python36 "/var/lib/awx/venv/ansible2.7.8/bin/pip3 install python-memcached psutil"
scl enable rh-python36 "/var/lib/awx/venv/ansible2.7.8/bin/pip3 install -U \"ansible == 2.7.8\""