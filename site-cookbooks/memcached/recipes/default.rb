#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2013, Fumihiro Ito
#
# All rights reserved - Do Not Redistribute
#

package "memcached" do
  action :install
end

service "memcached" do
  action [:enable, :start]
end

template "/etc/sysconfig/memcached" do
  source "etc/memcached"
  user "root"
  group "root"
  mode 0644
  variables({
    :port => node['memcached']['port'],
    :user => node['memcached']['user'],
    :cachesize => node['memcached']['cachesize'],
  })
end
