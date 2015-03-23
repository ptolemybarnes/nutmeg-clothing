require 'sinatra/base'
require_relative './lib/shopping_cart.rb'

class NutmegClothing < Sinatra::Base
  set :shopping_cart, ShoppingCart.new

  get '/' do
    'Hello NutmegClothing!'
  end

  run! if app_file == $0
end
