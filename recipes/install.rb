#
# Cookbook Name:: gce_gcsfuse
# Recipe:: install
#
# Copyright (c) 2016 Liqwyd Ltd. <vanders@liqwyd.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apt_repository 'google_cloud' do
  uri 'http://packages.cloud.google.com/apt'
  distribution "gcsfuse-#{node['lsb']['codename']}"
  components ['main']
  key 'https://packages.cloud.google.com/apt/doc/apt-key.gpg'
end

package 'gcsfuse'

# The user must be a member of the fuse filesystem
group 'fuse' do
  action :modify
  members node['gce_gcsfuse']['user']
  append true
end

# Ensure that the mountdir exists and is owned by the user that will run
# gcsfuse
# Note the guard; although normally the directory resource can do this check
# itself, it gets very confused when the FUSE filesystem is mounted
directory node['gce_gcsfuse']['mountdir'] do
  owner node['gce_gcsfuse']['user']
  group node['gce_gcsfuse']['group']
  mode '0755'
  not_if "mount | grep #{node['gce_gcsfuse']['mountdir']} >/dev/null"
end
