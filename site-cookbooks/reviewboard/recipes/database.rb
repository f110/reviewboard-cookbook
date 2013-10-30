execute "create database" do
  command "mysql -u root -e 'create database #{node['reviewboard']['database']['name']}'"
  not_if do
    databases = `mysql -u root -N -e 'SHOW DATABASES LIKE "#{node['reviewboard']['database']['name']}"'`
    !databases.nil? && databases.split("\n").count() > 0
  end
end

execute "create user" do
  command "mysql -u root -e 'GRANT ALL PRIVILEGES ON #{node['reviewboard']['database']['name']}.* TO #{node['reviewboard']['database']['user']}@\"localhost\" IDENTIFIED BY \"#{node['reviewboard']['database']['pass']}\"'"
  not_if do
    user = `mysql -u root -N -e 'select count(*) from mysql.user where User = "#{node['reviewboard']['database']['user']}"'`
    user.to_i > 0
  end
end
