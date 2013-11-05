node['mysql']['server']['packages'].each do |name|
  package name do
    action :install
  end
end

template '/etc/my.cnf' do
  source 'etc/my.cnf.master.erb'
  mode 0644
  owner 'root'
  group 'root'
  notifies :restart, 'service[mysqld]'
  variables({
    :user => node['mysql']['server']['user'],
    :server_id => node['mysql']['server']['id'],
  })
end

%w{/var/lib/mysql /run/mysqld}.each do |path|
  directory path do
    action :create
    user node['mysql']['server']['user']
    group node['mysql']['server']['group']
  end
end

service 'mysqld' do
  action [:enable, :start]
end
