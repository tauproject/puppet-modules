# $Tau: puppet/modules/tau/manifests/init.pp $

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

class tau
{
	stage { 'users': } -> Stage['main'] ->
	stage { 'ready': }

	$default_classes = [ ]
	$default_roles = [ 'default' ]

	tau_hiera_include('classes', '', $default_classes)
	tau_hiera_include('roles', 'tau::roles', $default_roles)
}

