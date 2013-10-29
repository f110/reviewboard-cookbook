directory '/var/lib/mysql' do
  action :create
  user 'mysql'
  group 'mysql'
end

directory '/run/mysqld' do
  action :create
  user 'mysql'
  group 'mysql'
end

template '/etc/my.cnf' do
  source 'etc/my.cnf.slave.erb'
  mode 0644
  owner 'root'
  group 'root'
  notifies :restart, 'service[mysqld]'
  variables({
    :server_id => node['mysql']['server']['id']
  })
end
