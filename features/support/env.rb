ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', '/app/app')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'airborne'

require_relative "./knows_the_domain.rb"
require_relative "./knows_the_ui.rb"

Capybara.app = NutmegClothing

Airborne.configure do |config|
  config.rack_app = Capybara.app 
end

class NutmegClothingWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
  include Airborne
end

World do
  NutmegClothingWorld.new
end

