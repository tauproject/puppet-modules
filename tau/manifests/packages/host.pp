# $Tau: puppet/modules/tau/manifests/packages/host.pp $

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

## Install packages deployed to production hosts.

class tau::packages::host (
	$docker = $tau::packages::docker,
	$openssh = $tau::packages::openssh,
) inherits tau::packages {

	class { "tau::packages::host::${::osfamily}":
		stage => packages,
	}

	if($docker)
	{
		class { 'docker':
			stage => packages
		}
	}
	if($openssh)
	{		
		class { 'openssh':
			stage => packages,
			template => 'tau/ssh/sshd_config.erb',
		}
	}
}

class tau::packages::host::debian {
	package { [ 'man-db', 'nano', 'rsync', 'wget', 'puppet', 'sudo', 'less' ]:
		ensure => latest,
	}	
}
