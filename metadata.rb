name             "strongSwan-base"
maintainer       "Jerry Jackson"
maintainer_email "jerry.jackson@acommitteeoflunatics.com"
license          "All Rights Reserved"
description      "Installs/Configures a strongSwan VPN"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION'))

depends 'route53'
depends 'yum-epel'
# depends 'strongSwan-scenarios'

# recommends 'strongSwan-pki'

supports 'amazon'
supports 'centos', ">= 6.0"
supports 'debian', ">= 7.0"
supports 'fedora', ">= 19.0"
supports 'oracle', ">= 6.0"
supports 'redhat', ">= 6.0"
supports 'ubuntu', ">= 14.04"
