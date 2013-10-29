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
  source 'etc/my.cnf.master.erb'
  mode 0644
  owner 'root'
  group 'root'
  notifies :restart, 'service[mysqld]'
  variables({
    :server_id => node['mysql']['server']['id']
  })
end

replication_user = "repl"
execute 'create mysql user for replication' do
  command %Q(mysql -u root -e "GRANT REPLICATION SLAVE ON *.* TO #{replication_user}@'%'")
  not_if %Q(test `mysql -u root -N -e 'SELECT count(1) FROM mysql.user WHERE User = "#{replication_user}"'` -gt 0)
end
