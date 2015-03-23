require 'sinatra/base'
require_relative './lib/shopping_cart.rb'
require_relative './lib/item.rb'

class NutmegClothing < Sinatra::Base
  set :shopping_cart, ShoppingCart.new
  set :stock_items  , [Item.new]

  get '/' do
    'Hello NutmegClothing!'
  end

  run! if app_file == $0
end
