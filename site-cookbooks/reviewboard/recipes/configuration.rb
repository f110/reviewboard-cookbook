user node['reviewboard']['apache']['user'] do
  action :create
end

group node['reviewboard']['apache']['group'] do
  action :create
end

(major, minor, bugfix) = node['languages']['python']['version'].split(".")
python_version = "#{major}.#{minor}"

template '/etc/httpd/conf.d/reviewboard.conf' do
  source 'httpd/reviewboard.conf.erb'
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[httpd]"
  variables({
    :root => node['reviewboard']['install_dir'],
    :port => node['reviewboard']['port'],
    :domain => node['reviewboard']['domain'],
    :user => node['reviewboard']['apache']['user'],
    :group => node['reviewboard']['apache']['group'],
    :rb_prefix => node['reviewboard']['prefix'],
    :py_version => python_version,
  })
end

directory "#{node['reviewboard']['install_dir']}/data" do
  user "apache"
  recursive true
end

directory "#{node['reviewboard']['install_dir']}/htdocs/media/ext" do
  user "apache"
  recursive true
end
