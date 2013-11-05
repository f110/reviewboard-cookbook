default['mysql']['server']['user'] = 'mysql'
default['mysql']['server']['group'] = 'mysql'
default['mysql']['server']['id'] = 1

case node['platform_family']
when 'fedora'
  default['mysql']['server']['packages'] = node['platform_version'].to_i >= 19 ? %w[community-mysql-server] : %w[mysql-server]
else
  default['mysql']['server']['packages'] = %w[mysql-server]
end
