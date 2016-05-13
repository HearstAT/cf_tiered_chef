#
# Cookbook Name:: cf_tiered_chef
# Recipe:: analytics
#
# Copyright 2016, Hearst Automation Team
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# This recipe installs the analytics server.

package 'opscode-analytics'

include_recipe 'cf_tiered_chef::disable_iptables'
include_recipe 'cf_tiered_chef::mail'
if node['cf_tiered_chef']['newrelic']['enable']
  include_recipe 'cf_tiered_chef::newrelic'
end
if node['cf_tiered_chef']['sumologic']['enable']
  include_recipe 'cf_tiered_chef::sumologic'
end

template '/etc/hosts' do
  action :create
  source 'analytics_hosts.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

# Create and place the analytics configuration file
directory '/etc/opscode-analytics' do
  action :create
  owner 'root'
  group 'root'
  mode '0644'
end

template '/etc/opscode-analytics/opscode-analytics.rb' do
  action :create
  source 'opscode_analytics.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

directory '/var/opt/opscode-analytics/nginx/etc/nginx.d/' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

# Unpack the server files
execute "tar -zxvf #{node['cf_tiered_chef']['s3']['dir']}/analytics_bundle.tar.gz" do
  action :run
  cwd '/'
end

template '/var/opt/opscode-analytics/nginx/etc/nginx.d/stage.conf' do
  source 'stage_analytics.conf.erb'
  owner 'root'
  group 'root'
  mode 00777
end

execute 'opscode-analytics-ctl reconfigure --accept-license'
execute 'opscode-analytics-ctl restart'
