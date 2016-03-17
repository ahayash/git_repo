#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "apache2" do
  action :install
end


service "apache2" do
  action [ :enable, :start]
end


template "apache2.conf" do
  path "/etc/apache2/apache2.conf"
  owner "root"
  group "root"
  mode 0644
  notifies :reload, 'service[apache2]'
end
