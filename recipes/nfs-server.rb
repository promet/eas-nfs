#
# Cookbook Name:: eas-nfs
# Recipe:: nfs
#
# Copyright (C) 2014 Promet Solutions, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'nfs::server'

node['aws_nfs']['nfs-export'].each do |name, config|

# see that the mount point exists
directory config['path'] do
  owner 'root'
  group 'root'
  recursive true
end

nfs_export config['path'] do
  network config['network']
  writeable config['writeable']
  sync config['sync']
  options ['no_root_squash']
end

end
