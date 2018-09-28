require 'simplecov'
SimpleCov.start do 
  minimum_coverage 100.0 
  add_filter '/spec/'
end

require_relative '../lib/decorator' 
Dir["#{File.dirname(__FILE__)}/../lib/**/*.rb"].each { |file| require file }
