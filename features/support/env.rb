# Generated by cucumber-sinatra. (2015-03-23 13:06:26 +0000)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app/app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

require_relative './knows_the_domain.rb'

Capybara.app = NutmegClothing

class NutmegClothingWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  NutmegClothingWorld.new
end
