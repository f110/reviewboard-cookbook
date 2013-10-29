#include_attribute "reviewboard::database"

rb_site = "#{node['reviewboard']['prefix']}/bin/rb-site"

directory node['reviewboard']['install_dir'] do
  action :create
  user "root"
  group "root"
  mode 0755
end

execute "setup reviewboard" do
  command "#{rb_site} install --noinput --domain-name=#{node['reviewboard']['domain']} --site-root=#{node['reviewboard']['siteroot']} --media-url=#{node['reviewboard']['media_url']} --db-type=#{node['reviewboard']['dbtype']} --db-name=#{node['reviewboard']['database']['name']} --db-host=#{node['reviewboard']['database']['host']} --db-user=#{node['reviewboard']['database']['user']} --db-pass=#{node['reviewboard']['database']['pass']} --cache-type=#{node['reviewboard']['cache']} --web-server-type=#{node['reviewboard']['webserver']} --python-loader=#{node['reviewboard']['python_loader']} #{node['reviewboard']['install_dir']}"
  not_if { Dir::entries(node['reviewboard']['install_dir']).count > 2 }
end
