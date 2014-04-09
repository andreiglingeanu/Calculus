require 'rubygems'
require 'bundler'
require 'sinatra/reloader'
require './extends.rb'
require './helpers.rb'

Bundler.require

require './solver.rb'
require './example.rb'
require './calculus.rb'
run Calculus
