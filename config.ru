require 'rubygems'
require 'bundler'
require 'sinatra/reloader'
require './extends.rb'

Bundler.require

require './solver.rb'
require './calculus.rb'
run Calculus
