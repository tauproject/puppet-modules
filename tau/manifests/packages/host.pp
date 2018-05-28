# @(#) $Tau: puppet/modules/tau/manifests/packages/host.pp $

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
