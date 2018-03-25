# $Tau: puppet/modules/tau/manifests/packages.pp $

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

## Install a common set of packages. Invoked automatically by Class['tau'].
## Other package set classes inherit from Class['tau::packages'].

class tau::packages (
	$common = $tau::packages::defaults::common,
	$openssh = $tau::packages::defaults::openssh,
	$docker = $tau::packages::defaults::docker,
) inherits tau::packages::defaults {
	stage { 'packages':
		before => [ Stage['users'], Stage['main'], ],
	}

	if( $common ) {
		class { "tau::packages::${::osfamily}":
			stage => packages,
		}
	}
}

class tau::packages::debian {
	package { [ 'gnupg', 'curl', 'lsb-release', 'procps' ]:
		ensure => latest,
	}
}
