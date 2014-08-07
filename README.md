# strongSwan-base chef cookbook

`strongSwan-base` and it's accompanying suite of dependant and recommended cookbooks is 
the new direction we have decided upon for the future

## Some Important Notes

When reading/adjusting any StrongSwan configurations, remember these important words:

        left is local to the machine it's stated on; right is remote in the same manner

So on the server side left is local to the server and on the client left is local to 
that client. Remembering this will save you many a headache.

## Requirements

All code from the original strongswan cookbook has been split out into three seperate 
cookbooks to better follow best practices. The three cookbooks included in this new
suite have been (re)named as follows:

- required to build a VPN
-- `strongSwan-base`       - sets up a basic StrongSwan server and accompanying networks.
-- `strongSwan-scenarios`  - one idempotent location for all available and active scenarios.
- recommended if you want full functionality of your VPN
-- `strongSwan-pki`        - allows generation of a simplyCA server and cert/key generation and distribution.