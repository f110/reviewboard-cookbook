default['reviewboard']['version'] = "1.7.16"
default['reviewboard']['prefix'] = "/usr/local/reviewboard"
default['reviewboard']['install_dir'] = "/var/www/reviewboard"
default['reviewboard']['domain'] = "rb.local"
default['reviewboard']['port'] = "80"
default['reviewboard']['dbtype'] = "mysql"
default['reviewboard']['cache'] = "memcached"
default['reviewboard']['webserver'] = "apache"
default['reviewboard']['siteroot'] = "/"
default['reviewboard']['media_url'] = "media/"
default['reviewboard']['python_loader'] = "wsgi"
default['reviewboard']['apache']['user'] = "reviewboard"
default['reviewboard']['apache']['group'] = "reviewboard"
default['reviewboard']['admin']['name'] = "admin"
default['reviewboard']['admin']['password'] = "admin"
default['reviewboard']['admin']['email'] = "root@localhost"

case node['platform_family']
when 'fedora'
  default['reviewboard']['dependence']['packages'] = node['platform_version'].to_i >= 19 ? %w[python-devel community-mysql-devel patch] : %w[python-devel mysql-devel patch]
else
  default['reviewboard']['dependence']['packages'] = %w[python-devel mysql-devel patch]
end
