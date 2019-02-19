yum_package 'httpd' do
  action :install
end

service 'httpd' do
  action :enable
end

service 'httpd' do
  action :start
end

directory '/tmp/testdir' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive	true
end
