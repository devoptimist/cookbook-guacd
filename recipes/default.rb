#
# Cookbook:: guacd
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

if node['platform_family'] == 'debian'
  apt_update
elsif node['platform'] == 'centos'
  package 'epel-release'

  remote_file node['guacd']['nux_file'] do
    source node['guacd']['nux_repo']
  end
  rpm_package node['guacd']['nux_file']
end

package node['guacd']['packages']

remote_file node['guacd']['cache_file'] do
  source node['guacd']['source_url']
end

directory node['guacd']['extract_path'] do
  recursive true
end

execute 'extract_source' do
  command "tar xzf #{node['guacd']['cache_file']} -C #{node['guacd']['extract_path']} --strip-components=1"
  environment ({'PATH' => node['guacd']['path']})
  not_if { ::File.file?(node['guacd']['extract_path_file']) }
end

execute 'configure_make_install' do
  command './configure --with-init-dir=/etc/init.d && make && make install && ldconfig'
  cwd node['guacd']['extract_path']
  environment ({'PATH' => node['guacd']['path']})
  creates node['guacd']['bin_path']
end

service 'guacd' do
  action %i(enable start)
end
