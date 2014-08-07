# strongSwan-base chef cookbook

## Overview

`strongSwan-base` and it's accompanying suite of dependant and recommended cookbooks is 
the new direction we have decided upon for the future of our strongSwan offering. This 
cookbook is intended to allow the creation of a fully-functional VPN endpoint within 
an Amazon VPC.

## Some Important Notes

When reading/adjusting any StrongSwan configurations, remember these important words:

**```  left is local to the machine it's stated on; right is remote in the same manner  ```**

So, on the server side, left is local to the server and on the client side, left is local to 
that client. Remembering this will save you many a headache as you navigate the tangled web 
of information available for setting up a properly secured VPN with optimal compatibility. 
The [strongSwan wiki](https://wiki.strongswan.org/projects/strongswan/wiki/UserDocumentation) 
is an excellent source of data, however, I wouldn't let that keep me from checking for any other 
available information on configuring my particular use case.

## Requirements

All code from the original strongswan cookbook has been split out into three seperate 
cookbooks to better follow best practices. The three cookbooks included in this new
suite have been (re)named as follows:

- required to build a minimally functional VPN endpoint
  - `strongSwan-base`       - sets up a basic StrongSwan server and accompanying networks.
  - `strongSwan-scenarios`  - one idempotent location for all available and active scenarios.
- recommended if you want full functionality of your VPN
  - `strongSwan-pki`        - allows generation of a simplyCA server and certificate/key 
generation, distribution and revocation.
