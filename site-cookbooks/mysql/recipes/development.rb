execute 'create mysql user for development' do
  command %Q(mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO root@'%'")
  not_if %Q(test `mysql -u root -N -e 'SELECT count(1) FROM mysql.user WHERE User = "root" and Host = "%"'` -gt 0)
end
