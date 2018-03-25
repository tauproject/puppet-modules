# $Tau: puppet/modules/tau/manifests/roles/host.pp $

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

class tau::roles::host inherits tau::roles
{
	class { 'tau::packages::host':
		stage => packages,
	}

	class { 'tau::users':
	}
	
	class { 'tau::motd':
		stage => 'ready',
	}
	
}
