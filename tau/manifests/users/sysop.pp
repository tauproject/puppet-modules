# @(#) $Tau: puppet/modules/tau/manifests/users/sysop.pp $

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

