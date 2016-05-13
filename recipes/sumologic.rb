#
# Cookbook Name:: cf_tiered_chef
# Recipe:: sumologic
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
# This recipe configures sumologic for the chef servers.

node.default['sumologic']['credentials'] = nil

node.default['sumologic']['accessID'] = citadel['sumologic/access_id']
node.default['sumologic']['accessKey'] = citadel['sumologic/access_key']
node.default['sumologic']['password'] = citadel['sumologic/password']

node.default['sumologic']['sources'] = [
  {
    name: 'Messages',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'OS/Linux/System',
    pathExpression: '/var/log/messages'
  },
  {
    name: 'Secure',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'OS/Linux/Security',
    pathExpression: '/var/log/secure'
  },
  {
    name: 'Syslog File',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'OS/Linux/System',
    pathExpression: '/var/log/syslog'
  },
  # Chef Server
  {
    name: 'chef_erchef',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef/erchef',
    pathExpression: '/var/log/opscode/opscode-erchef/current'
  },
  {
    name: 'chef_keepalived',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef/keepalived',
    pathExpression: '/var/log/opscode/keepalived/current'
  },
  {
    name: 'chef_nginx',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef/nginx',
    pathExpression: '/var/log/opscode/nginx/*.log'
  },
  {
    name: 'chef_postgresql',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef/postgresql',
    pathExpression: '/var/log/opscode/postgresql/9.2/current'
  },
  {
    name: 'chef_rabbitmq',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef/rabbitmq',
    pathExpression: '/var/log/opscode/rabbitmq/current'
  },
  {
    name: 'chef_redis_lb',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef/redis_lb',
    pathExpression: '/var/log/opscode/redis_lb/current'
  },
  {
    name: 'chef_solr',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef/solr',
    pathExpression: '/var/log/opscode/opscode-solr4/current'
  },
  # Chef Analytics
  {
    name: 'chef_analytics_actions',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef_analytics/actions',
    pathExpression: '/var/log/opscode-analytics/actions/current'
  },
  {
    name: 'chef_analytics_actions_messages',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef_analytics/actions_messages',
    pathExpression: '/var/log/opscode-analytics/actions_messages/current'
  },
  {
    name: 'chef_analytics_alaska',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef_analytics/alaska',
    pathExpression: '/var/log/opscode-analytics/alaska/current'
  },
  {
    name: 'chef_analytics_nginx',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef_analytics/nginx',
    pathExpression: '/var/log/opscode-analytics/nginx/*.log'
  },
  {
    name: 'chef_analytics_postgresql',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef_analytics/postgresql',
    pathExpression: '/var/log/opscode-analytics/postgresql/9.2/current'
  },
  {
    name: 'chef_analytics_rabbitmq',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef_analytics/rabbitmq',
    pathExpression: '/var/log/opscode-analytics/rabbitmq/current'
  },
  {
    name: 'chef_analytics_storm',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef_analytics/storm',
    pathExpression: '/var/log/opscode-analytics/storm/current'
  },
  {
    name: 'chef_analytics_zookeeper',
    sourceType: 'LocalFile',
    automaticDateParsing: true,
    multilineProcessingEnabled: false,
    useAutolineMatching: true,
    forceTimeZone: false,
    timeZone: 'UTC',
    category: 'chef_analytics/erchef',
    pathExpression: '/var/log/opscode-analytics/zookeeper/current'
  }
]
include_recipe 'sumologic-collector'
include_recipe 'sumologic-collector::sumojson'
