name 'guacd'
maintainer 'Steve Brown'
maintainer_email 'sbrown@chef.io'
license 'Apache-2.0'
description 'Installs/Configures guacd'
long_description 'Installs/Configures guacd'
version '0.1.0'
chef_version '>= 13.0'

%w(centos ubuntu).each do |os|
  supports os
end

issues_url 'https://github.com/devoptimist/guacd/issues'
source_url 'https://github.com/devoptimist/guacd'
