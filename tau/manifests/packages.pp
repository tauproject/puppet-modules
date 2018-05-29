# @(#) $Tau: puppet/modules/tau/manifests/packages.pp $

## ------------------------------------------------------------------------- ##
##                          T A U    P R O J E C T                           ##
## ------------------------------------------------------------------------- ##
##                                                                           ##
##  Licensed under the Apache License, Version 2.0 (the "License");          ##
##  you may not use this file except in compliance with the License.         ##
##                                                                           ##
##  You may obtain a copy of the License at:                                 ##
##                                                                           ##
##      http://www.apache.org/licenses/LICENSE-2.0                           ##
##                                                                           ##
##  Unless required by applicable law or agreed to in writing, software      ##
##  distributed under the License is distributed on an "AS-IS" BASIS,        ##
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. ##
##  See the License for the specific language governing permissions and      ##
##  limitations under the License.                                           ##
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

class tau::packages::darwin {
}
