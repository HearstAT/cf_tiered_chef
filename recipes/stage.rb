#
# Cookbook Name:: cf_tiered_chef
# Recipe:: stage
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
# This recipe configures the stage config for blue/green deployment.

execute 'restart-nginx' do
  command 'chef-server-ctl restart nginx'
  action :nothing
end

execute 'sleep' do
  command 'sleep 30'
  action :nothing
end

directory '/var/opt/opscode/nginx/etc/nginx.d' do
  owner 'root'
  group 'root'
  mode 00755
  recursive true
  action :create
end

template "/var/opt/opscode/nginx/etc/nginx.d/#{node['cf_tiered_chef']['prime_domain']}.conf" do
  source 'site.conf.erb'
  owner 'root'
  group 'root'
  mode 00777
  variables ({
    subdomains: [node['cf_tiered_chef']['stage_subdomain']],
    domain: node['cf_tiered_chef']['prime_domain']
  })
  notifies :run, 'execute[sleep]', :immediately
  notifies :run, 'execute[restart-nginx]', :immediately
end

template "/var/opt/opscode/nginx/etc/nginx.d/#{node['cf_tiered_chef']['secondary_domain']}.conf" do
  source 'site.conf.erb'
  owner 'root'
  group 'root'
  mode 00777
  variables ({
    subdomains: ["chef", node['cf_tiered_chef']['stage_subdomain']],
    domain: node['cf_tiered_chef']['secondary_domain']
  })
  only_if { node['cf_tiered_chef']['secondary_domain'] }
  notifies :run, 'execute[sleep]', :immediately
  notifies :run, 'execute[restart-nginx]', :immediately
end
