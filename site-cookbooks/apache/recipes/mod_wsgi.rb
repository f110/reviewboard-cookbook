node['apache']['mod_wsgi']['packages'].each do |p_name|
  package p_name do
    action :install
  end
end
