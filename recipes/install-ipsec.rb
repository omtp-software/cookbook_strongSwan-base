#
# Cookbook Name:: strongSwan-base
# Description:: Installs and launches a StrongSwan server.
# Recipe:: ipsec
# Author:: Jerry Jackson (<jerry.w.jackson@gmail.com>)
#
# Copyright 2012, Infochimps
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
#

case node['platform_family']
	when 'arch'
		if (node['strongSwan']['use-network-manager'] == 'true')
			packages = %w{ strongswan, networkmanager-strongswan }
		else
			packages = %w{ strongswan }
		end
	when 'debian'
		include_recipe "apt"
		if (node['strongSwan']['use-network-manager'] == 'true')
			if platform?("ubuntu", "mint")
				packages = %w{ strongswan, network-manager-strongswan }
			else
				packages = %w{ strongswan, strongswan-nm }
			end
		else
			packages = %w{ strongswan }
		end
	when 'rhel'
		node.default['yum']['epel-testing']['enabled'] = true
		node.default['yum']['epel-testing']['managed'] = true
		include_recipe 'yum-epel'
		packages = %w{ strongswan }
	when 'fedora'
		if (node['strongSwan']['use-network-manager'] == 'true')
			packages = %w{ strongswan, strongswan-charon-nm }
		else
			packages = %w{ strongswan }
		end
	when 'mac_os_x'
		# put mac specific instructions here
	when 'windows'
		# install instructions with executable binary
	else
		Chef::Log.error "There are no packages available for this platform; please build strongSwan from source."
		return
end
packages.each do |node_pkg|
	package node_pkg
end

# ipsec service definition
service "ipsec" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable ]
end

%w{ ipsec.conf ipsec.secrets strongswan.conf }.each do |fname|
  template "/etc/#{fname}" do
    source "ipsec-core/#{fname}.erb"
    notifies :reload, "service[ipsec]", :delayed
  end
end

announce( :strongswan, :ipsec )
