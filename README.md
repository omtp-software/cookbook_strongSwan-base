# strongswan chef cookbook

## Some Important Notes

When reading/adjusting any StrongSwan configurations, remember these important words:

        left is local to the machine it's stated on; right is remote in the same manner

So on the server side left is local to the server and on the client left is local to 
that client. Remembering this will save you many a headache.

## Requirements

All code from the original strongswan cookbook has been split out into three repositories 
to better follow best practices. These three repositories are named as follows:

`strongSwan-base`       - sets up a basic StrongSwan server and accompanying networks.
`strongSwan-scenarios`  - one idempotent location for all available and active scenarios.
`strongSwan-pki`        - allows generation of a simplyCA server and cert/key generation and distribution.