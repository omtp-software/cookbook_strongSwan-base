name             "strongSwan-base"
maintainer       "Jerry Jackson"
maintainer_email "jerry.jackson@acommitteeoflunatics.com"
license          "All Rights Reserved"
description      "Installs/Configures a strongSwan gateway, host, or scenario"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION'))

depends 'sysctl'
depends 'iptables' # look at using "depends 'iptables-ng'"
depends 'apt'
depends 'yum-epel'

depends 'strongSwan-scenarios'
depends 'strongSwan-pki'

supports 'arch'
supports 'debian', ">= 7.0"
supports 'fedora', ">= 19.0"
supports 'rhel', ">= 6.0"
supports 'ubuntu', ">= 14.04"
