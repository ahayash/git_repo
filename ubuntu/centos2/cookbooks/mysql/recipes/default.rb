#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{mysql mysql-server}.each do |pkg|
  package pkg do
    action :install
  end
end

service "mysql" do
  action [:enable, :start]
end

execute "set root password" do
  command "mysqladmin -u root password '#{node['mysql']['server_root_password']}'"
  only _if "mysql -u root -e 'show databases;'"
end
