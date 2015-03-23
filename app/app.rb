require 'sinatra/base'
require 'sinatra/json'
require_relative './lib/shopping_cart.rb'
require_relative './lib/item.rb'

class NutmegClothing < Sinatra::Base
  set :shopping_cart, ShoppingCart.new
  set :stock_items  , [Item.new]

  helpers Sinatra::JSON

  get '/' do
    'Hello NutmegClothing!'
  end

  # API

  get '/api/stock_items' do
    json settings.stock_items.map(&:extract)
  end

  run! if app_file == $0
end
