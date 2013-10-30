#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, Fumihiro Ito
#
# All rights reserved - Do Not Redistribute
#

node['apache']['packages'].each do |p_name|
  package p_name do
    action :install
  end
end

service "httpd" do
  action [:enable, :start]
end
