case node['platform_family']
when 'fedora'
  default['apache']['packages'] = %w[httpd]
  default['apache']['mod_wsgi']['packages'] = %w[mod_wsgi]
else
  default['apache']['packages'] = %w[apache2]
  default['apache']['mod_wsgi']['packages'] = %w[mod_wsgi]
end

