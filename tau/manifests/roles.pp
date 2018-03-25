# $Tau: puppet/modules/tau/manifests/roles.pp $

## ------------------------------------------------------------------------- ##
##                          T A U    P R O J E C T                           ##
## ------------------------------------------------------------------------- ##
##                                                                           ##
## This file forms part of the Tau Project and is subject to copyright.      ##
##                                                                           ##
## For full licensing terms, including conditions for redistribution, please ##
## consult the README document accompanying the source distribution:         ##
##                                                                           ##
##   <https://github.com/tauproject/puppet>                                  ##
##                                                                           ##
## ------------------------------------------------------------------------- ##

## This is a base class for all roles. To customise the roles for a node,
## provide a 'roles' array via Hiera:
##
## ---
## roles:
##   - host
##
## If no roles array is provided, the default value is [ 'default' ],
## (see Class['tau::roles::default']).

class tau::roles
{
	include tau
	include tau::packages
}
