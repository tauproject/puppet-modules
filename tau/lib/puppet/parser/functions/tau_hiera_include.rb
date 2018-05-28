# @(#) $Tau: puppet/modules/tau/lib/puppet/parser/functions/tau_hiera_include.rb $

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
require 'hiera_puppet'

module Puppet::Parser::Functions
	newfunction(:tau_hiera_include, :arity => -2, :doc => "Assigns classes defined in Hiera with a specified prefix") do |*args|
		key, prefix, defaults = HieraPuppet.parse_args(args)
		if answer = HieraPuppet.lookup(key, defaults, self, nil, :array)
			answer.each { |classname| call_function( 'include', [ "#{prefix}::#{classname}" ]) }
		else
			raise Puppet::ParseError, "Could not locate data item #{key} via Hiera and no default value was provided"
		end
	end
end

