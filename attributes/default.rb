#
# Cookbook Name:: cf_tiered_chef
# Default Attributes File
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

# Pass to pull a backup and use knife ec to restore
default['cf_tiered_chef']['backup']['restore'] = false
default['cf_tiered_chef']['backup']['enable_backups'] = false
default['cf_tiered_chef']['backup']['restore_file'] = ''

# S3 Bucket mount location accomplished during CFN
default['cf_tiered_chef']['s3']['dir'] = ''

# SSL Config
default['cf_tiered_chef']['ssl']['enable'] = true

# Manage Attributes
default['cf_tiered_chef']['manage']['signupdisable'] = ''
default['cf_tiered_chef']['manage']['supportemail'] = ''

# Mail Relay host
default['cf_tiered_chef']['mail']['relayhost'] = ''
default['cf_tiered_chef']['mail']['relayport'] = ''

# License Count Info
default['cf_tiered_chef']['licensecount'] = '25'

# FQDN of your Amazon Elastic Load Balancer or Route53 CNAME to load balancer DNS
default['cf_tiered_chef']['api_fqdn'] = ''

# Domain provided via Route53 hosted zone
default['cf_tiered_chef']['prime_domain'] = ''
default['cf_tiered_chef']['secondary_domain'] = ''

# Database Config
default['cf_tiered_chef']['database']['ext_enable'] = ''
default['cf_tiered_chef']['database']['port'] = ''
default['cf_tiered_chef']['database']['url'] = ''

# Cookbook Config
default['cf_tiered_chef']['cookbook']['ext_enable'] = ''
default['cf_tiered_chef']['cookbook']['bucket'] = ''

# Analytic Server Config
default['cf_tiered_chef']['analytics']['stage_subdomain'] = ''
default['cf_tiered_chef']['analytics']['url'] = ''
default['cf_tiered_chef']['analytics']['fqdn'] = ''
default['cf_tiered_chef']['analytics']['ip_address'] = ''

# Backend Attributes
default['cf_tiered_chef']['backend']['fqdn']        = ''
default['cf_tiered_chef']['backend']['ip_address']  = ''

# Shared VIP address for the backend servers, needs to be known by all servers
default['cf_tiered_chef']['backend_vip']['fqdn']       = ''
default['cf_tiered_chef']['backend_vip']['ip_address'] = ''

# Frontend Attributes
default['cf_tiered_chef']['frontends']['fe01']['fqdn']          = ''
default['cf_tiered_chef']['frontends']['fe01']['ip_address']    = ''

# Frontend Attributes
default['cf_tiered_chef']['frontends']['fe02']['fqdn']          = ''
default['cf_tiered_chef']['frontends']['fe02']['ip_address']    = ''

# Citadel
default['citadel']['bucket'] = ''
default['sumologic']['userID'] = ''

# Newrelic
default['cf_tiered_chef']['newrelic']['enable'] = true
default['cf_tiered_chef']['newrelic']['appname'] = ''

# Sumologic
default['cf_tiered_chef']['sumologic']['enable'] = true
