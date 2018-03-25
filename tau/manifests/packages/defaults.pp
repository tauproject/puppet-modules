# $Tau: puppet/modules/tau/manifests/packages/defaults.pp $

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

## These defaults control which additional packages may be managed by
## particular roles. A value of true does not imply that the package will be
## installed and managed unless a role requests it. However, setting a value
## of false will prevent that package from being installed or managed by
## any role.
##
## To override these defaults, specify them in Hiera with a 'tau::packages'
## prefix:
##
## ---
## tau::packages::docker: no
## tau::packages::openssh: no

class tau::packages::defaults (
	$common = true,
	$docker = true,
	$openssh = true,
) {
}
