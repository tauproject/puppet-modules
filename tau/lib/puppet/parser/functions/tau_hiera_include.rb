# $Tau: puppet/modules/tau/lib/puppet/parser/functions/tau_hiera_include.rb $

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

