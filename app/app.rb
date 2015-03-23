require 'sinatra/base'
require 'sinatra/json'
require_relative './lib/shopping_cart.rb'
require_relative './lib/item.rb'

class NutmegClothing < Sinatra::Base
  set :root, File.dirname(__FILE__)
  
  set :shopping_cart, ShoppingCart.new
  set :stock_items  , Array.new(10, Item.new(name: "Jeans", category: "Men's Casualwear", price: 1000, quantity: 5))
  alias_method :s, :settings

  helpers Sinatra::JSON

  get '/' do
    send_file "./app/views/index.html" 
  end

  # API

  get '/api/stock_items' do
    json settings.stock_items.map(&:extract)
  end

  get "/api/stock_items/:pid" do
    if item = Item.find_by(pid: params[:pid])
      json item.extract
    else
      json({ status: 400 })
    end
  end

  get '/api/shopping_cart' do
    json s.shopping_cart.items.map(&:extract)
  end

  put '/api/shopping_cart' do
    if (item = find_by_pid params[:item_pid])
      s.shopping_cart.add item
      200
    else
      400 
    end
  end

  helpers do
    def find_by_pid pid
      s.stock_items.select {|item| item.pid === pid }.sample
    end
  end

  run! if app_file == $0
end
