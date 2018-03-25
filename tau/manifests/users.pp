# $Tau: puppet/modules/tau/manifests/users.pp $

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

class tau::users
{
	class { 'tau::users::systemgroups':
		stage => users,
	}
	class { 'tau::users::sysop':
		stage => users,
	}
}

class tau::users::systemgroups
{
	group { [ 'sudo', 'docker', ]:
		ensure => present,
		system => true,
	}
}
