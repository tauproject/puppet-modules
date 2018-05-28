# @(#) $Tau: puppet/modules/tau/manifests/packages/defaults.pp $

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
