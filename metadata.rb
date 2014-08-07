name             "strongSwan-base"
maintainer       "Jerry Jackson"
maintainer_email "jerry.jackson@acommitteeoflunatics.com"
license          "All rights reserved"
description      "Installs/Configures strongswan"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION'))

depends 'route53'
