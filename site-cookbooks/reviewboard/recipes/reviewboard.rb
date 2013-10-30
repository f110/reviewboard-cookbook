pip_binary = "#{node['reviewboard']['prefix']}/bin/pip"
easy_install = "#{node['reviewboard']['prefix']}/bin/easy_install"

node['reviewboard']['dependence']['packages'].each do |p_name|
  package p_name do
    action :install
  end
end


execute "install depends on modules" do
  command "#{easy_install} mysql-python"
  not_if do
    installed_package = `#{pip_binary} list`.split("\n")
    installed_package.grep(/mysql-python/i).count > 0
  end
end

execute "install reviewboard" do
  command "#{easy_install} ReviewBoard==#{node['reviewboard']['version']}"
  not_if do
    installed_package = `#{pip_binary} list`.split("\n")
    installed_package.grep(/ReviewBoard/i).count > 0
  end
end
