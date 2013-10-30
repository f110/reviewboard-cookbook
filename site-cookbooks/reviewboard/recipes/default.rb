#
# Cookbook Name:: reviewboard
# Recipe:: default
#
# Copyright 2013, Fumihiro Ito
#
# All rights reserved - Do Not Redistribute
#

include_recipe "reviewboard::database"
include_recipe "reviewboard::env"
include_recipe "reviewboard::reviewboard"
include_recipe "reviewboard::patch"
include_recipe "reviewboard::setup"
include_recipe "reviewboard::configuration"
