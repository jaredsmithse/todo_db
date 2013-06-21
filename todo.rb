require_relative 'config/application'
require 'date'
# include View

Task.send(ARGV[0], ARGV[1..-1])
