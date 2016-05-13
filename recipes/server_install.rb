#
# Cookbook Name:: cf_tiered_chef
# Recipe:: post_install
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

# Run this recipe on every server *but* the primary to configure everything
include_recipe 'cf_tiered_chef::chef_addons'

# Unpack the server files
execute "tar -zxvf #{node['cf_tiered_chef']['s3']['dir']}/core_bundle.tar.gz" do
  action :run
  cwd '/'
end

# Unpack the reporting files
execute "tar -zxvf #{node['cf_tiered_chef']['s3']['dir']}/reporting_bundle.tar.gz" do
  action :run
  cwd '/'
end

# Unpack the push files
execute "tar -zxvf #{node['cf_tiered_chef']['s3']['dir']}/push_bundle.tar.gz" do
  action :run
  cwd '/'
  not_if { node['cf_tiered_chef']['database']['ext_enable'] }
end

# Configure all the things
execute 'chef-server-ctl reconfigure'

unless node['cf_tiered_chef']['database']['ext_enable']
  execute 'opscode-push-jobs-server-ctl reconfigure'
end

execute 'opscode-reporting-ctl reconfigure --accept-license'
execute 'chef-manage-ctl reconfigure --accept-license'
