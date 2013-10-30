(major, minor, bugfix) = node['languages']['python']['version'].split(".")
python_version = "#{major}.#{minor}"

pip_binary = "#{node['reviewboard']['prefix']}/bin/pip"
reviewboard_version = node['reviewboard']['version']

egg_path = "#{node['reviewboard']['prefix']}/lib/python#{python_version}/site-packages/ReviewBoard-#{reviewboard_version}-py#{python_version}.egg"


directory "#{node['reviewboard']['prefix']}/patch" do
  action :create
  mode 0755
end

cookbook_file "#{node['reviewboard']['prefix']}/patch/hostingsvcs-models.patch" do
  source "hostingsvcs-models.patch"
  owner "root"
  group "root"
  mode 0644
  not_if { File.exists?("#{node['reviewboard']['prefix']}/patch/hostingsvcs-models.patch") }
end

execute "patching" do
  command "patch -N #{egg_path}/reviewboard/hostingsvcs/models.py < #{node['reviewboard']['prefix']}/patch/hostingsvcs-models.patch"
  not_if do
    system("patch -N --dry-run #{egg_path}/reviewboard/hostingsvcs/models.py < #{node['reviewboard']['prefix']}/patch/hostingsvcs-models.patch")
    $? != 0 ? true : false
  end
end
