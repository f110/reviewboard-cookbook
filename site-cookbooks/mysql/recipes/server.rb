node['mysql']['server']['packages'].each do |name|
  package name do
    action :install
  end
end

service 'mysqld' do
  action [:enable, :start]
end
