default['guacd']['packages'] = case node['platform']
                               when 'ubuntu'
                                 %w(
                                   libjpeg-turbo8-dev libpng-dev libossp-uuid-dev
                                   gcc make libcairo2-dev libavcodec-dev
                                   libavutil-dev libswscale-dev libfreerdp-dev
                                   libpango1.0-dev libssh2-1-dev libtelnet-dev
                                   libvncserver-dev libpulse-dev libssl-dev
                                   libvorbis-dev libwebp-dev freerdp-x11
                                   ghostscript dpkg-dev
                                 )
                               when 'centos'
                                 %w(
                                   gcc make cairo-devel libjpeg-turbo-devel libpng-devel
                                   libuuid-devel freerdp-devel pango-devel libssh2-devel
                                   libtelnet-devel libvncserver-devel pulseaudio-libs-devel
                                   openssl-devel libvorbis-devel libwebp-devel ffmpeg-devel
                                   uuid-devel
                                 )
                               end

default['guacd']['path'] = '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin'
default['guacd']['file'] = 'guacamole-server'
default['guacd']['version'] = '1.0.0'
default['guacd']['base_url'] = 'http://mirrors.ukfast.co.uk/sites/ftp.apache.org/guacamole'
default['guacd']['ver_file'] = "#{node['guacd']['file']}-#{node['guacd']['version']}.tar.gz"
default['guacd']['url_target'] = "#{node['guacd']['version']}/source/#{node['guacd']['ver_file']}"
default['guacd']['source_url'] = "#{node['guacd']['base_url']}/#{node['guacd']['url_target']}"
default['guacd']['cache_file'] = ::File.join(Chef::Config[:file_cache_path], node['guacd']['ver_file'])
default['guacd']['extract_path'] = ::File.join(Chef::Config[:file_cache_path], 'guacamole_src')
default['guacd']['extract_path_file'] = ::File.join(Chef::Config[:file_cache_path], 'guacamole_src/compile')
default['guacd']['bin_path'] = '/usr/local/sbin/guacd'

# centos only
default['guacd']['nux_repo'] = 'http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-1.el7.nux.noarch.rpm'
default['guacd']['nux_file'] = ::File.join(Chef::Config[:file_cache_path], 'nux-dextop-release.rpm')
