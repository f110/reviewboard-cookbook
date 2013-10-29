default['reviewboard']['prefix'] = "/usr/local/reviewboard"
default['reviewboard']['install_dir'] = "/var/www/reviewboard"
default['reviewboard']['domain'] = "rb.local"
default['reviewboard']['dbtype'] = "mysql"
default['reviewboard']['cache'] = "memcached"
default['reviewboard']['webserver'] = "apache"
default['reviewboard']['siteroot'] = "/"
default['reviewboard']['media_url'] = "media/"
default['reviewboard']['python_loader'] = "wsgi"

case node['platform_family']
when 'fedora'
  default['reviewboard']['dependence']['packages'] = %w[python-devel mysql-devel patch]
else
  default['reviewboard']['dependence']['packages'] = %w[python-devel mysql-devel patch]
end
