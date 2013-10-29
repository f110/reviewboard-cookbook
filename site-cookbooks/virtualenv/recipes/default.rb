#
# Cookbook Name:: virtualenv
# Recipe:: default
#
# Copyright 2013, Fumihiro Ito
#
# All rights reserved - Do Not Redistribute
#

package node['python']['pip']['package'] do
  action :install
end

execute "install virtualenv by pip" do
  command "pip install virtualenv"
  not_if "which virtualenv"
end
