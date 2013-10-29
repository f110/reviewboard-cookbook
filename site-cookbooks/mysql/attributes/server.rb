default['mysql']['server']['id'] = 1

case node['platform_family']
when 'fedora'
  default['mysql']['server']['packages'] = %w[mysql-server]
else
  default['mysql']['server']['packages'] = %w[mysql-server]
end
