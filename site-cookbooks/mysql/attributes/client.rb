case node['platform_family']
when 'fedora'
  default['mysql']['server']['packages'] = %w[mysql]
else
  default['mysql']['server']['packages'] = %w[mysql]
end
