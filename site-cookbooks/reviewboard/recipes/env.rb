execute "create environment for reviewboard" do
  command "virtualenv #{node['reviewboard']['prefix']}"
  not_if { File.exists?(node['reviewboard']['prefix']) }
end
