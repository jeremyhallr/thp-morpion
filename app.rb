require 'pry'
require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)
$:.unshift File.expand_path("./../lib/views", __FILE__)

require 'application'
require 'board_case'
require 'board'
require 'game'
require 'player'
require 'show'

Application.new.perform