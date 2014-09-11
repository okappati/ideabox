$:.unshift File.expand_path("./../lib", __FILE__)

require 'bundler'
Bundler.require

require 'app'
# require 'nokogiri'
# require 'app'
run IdeaBoxApp
