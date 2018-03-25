# $Tau: puppet/modules/tau/manifests/users/sysop.pp $

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

class tau::users::sysop
{
	class { 'tau::users::sysop::create':
		stage => users,
	}
}

class tau::users::sysop::create
{
	group { 'sysop':
		ensure => present,
		system => false,
	}
	user { 'sysop':
		ensure => present,
		comment => 'System Operator',
		home => '/home/sysop',
		gid => sysop,
		groups => [ sysop, sudo, docker ],
		shell => '/bin/bash',
		system => false,
	}
}

