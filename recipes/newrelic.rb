#
# Cookbook Name:: cf_tiered_chef
# Recipe:: new_relic.rb
#
# Copyright (C) 2016 Hearst Business Media
#

include_recipe 'python::pip'

newrelic_server_monitor 'Install' do
  license citadel['newrelic/license']
end

newrelic_meetme_plugin 'default' do
  license citadel['newrelic/license']
end

template "/opt/opscode/embedded/service/oc_id/config/newrelic.yml" do
  source 'newrelic.yml.erb'
  owner 'root'
  group 'root'
  variables({
       license: citadel['newrelic/license']
  })
  mode 00644
  only_if { ::File.directory?("/opt/opscode/embedded/service/oc_id/config") }
end

template "/var/opt/chef-manage/etc/newrelic.yml" do
  source 'newrelic.yml.erb'
  owner 'root'
  group 'root'
  variables({
       license: citadel['newrelic/license']
  })
  mode 00644
  only_if { ::File.directory?("/var/opt/chef-manage/etc") }
end

