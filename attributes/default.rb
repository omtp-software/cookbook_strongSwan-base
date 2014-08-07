#
# Cookbook Name:: strongswan
# Attributes:: default

# scenario choices:
# - xauth-rsa-mode-config
#   - authorize with RSA certificates and a user:password combo
#   - the RSA shared out-of-band at the moment, since there's no real good way in-band
# - xauth-id-psk-mode-config
#   - authorize with a preshared key and a user:password combo
#   - the preshared key is stored in Chef attributes, and is thus relatively insecure
# - xl2tpd
#   - configure masquerading via the xl2tp daemon, to allow easy Mac client access
#   - probably going the out-of-band route for credentials
# See http://www.strongswan.org/uml/testresults/ for more scenario options; be
#   cautious and read everything multiple times. This stuff is quite convoluted.

default['strongSwan']['scenarios']                 = [
														'scenario_ikev2_rw-cert', 
														'scenario_ikev2_any-interface',
														'scenario_ikev1_nat-rw',
														'scenario_ikev1_xauth-id-rsa-config',
														'scenario_ikev1_xauth-id-psk-config',
														'scenario_ikev1_xauth-rsa'
													 ]
default['strongSwan']['scenarios']['default']      = ['scenario_ikev2_rw-cert']

# Enable NAT-transversal
default['strongSwan']['ipsec']['natt']             = 'yes'
# Use the older key-exchange protocol, to handle older clients
default['strongSwan']['ipsec']['keyexchange']      = 'ikev2'
# key exchange protocols
default['strongSwan']['ipsec']['ike']              = '3des-sha256-modp1536'
default['strongSwan']['ipsec']['esp']              = '3des-sha256'
# pre-shared key for '/etc/ipsec.secrets'
default['strongSwan']['ipsec']['psk']              = 'wehavenobananastoday'

## Hackity hack, don't talk back
default['strongSwan']['ipsec']['public_ip']        = node['ipaddress'] rescue '10.10.0.1'
default['strongSwan']['ipsec']['private_ip']       = node['cloud']['private_ips'].first rescue '192.168.0.1'

# When we refer to local here, we mean relative to the server itself.
#   Inside strongswan configuration, the convention is to call the local
#   machine/network the left side, and the remote the right side. This
#   is relative to the machine on which the configuration resides, which
#   can be somewhat confusing at first.
default['strongSwan']['ipsec']['local']['id']       = 'server@strongswan.org'
# We are protecting the entire VPC, not just this subnet
default['strongSwan']['ipsec']['local']['subnet']   = '10.10.0.0/16'
default['strongSwan']['ipsec']['remote']['id']        = 'client@strongswan.org'
# The virtual IP pool is outside the VPC
default['strongSwan']['ipsec']['remote']['sourceip']  = '10.100.255.0/28'

# ## for '/etc/xl2tpd/xl2tpd.conf'
# default['strongSwan']['l2tp']['ip_min'] = '10.107.0.51'
# default['strongSwan']['l2tp']['ip_max'] = '10.107.0.100'
# # for /etc/ppp/chap-secrets'
# default['strongSwan']['l2tp']['chapsecret'] = 'changeme'
