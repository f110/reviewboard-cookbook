#
# Cookbook Name:: supervisord
# Recipe:: default
#
# Copyright 2013, Fumihiro Ito
#
# All rights reserved - Do Not Redistribute
#

package 'supervisor' do
  action :install
end

service 'supervisord' do
  action [:enable, :start]
end
