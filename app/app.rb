require 'sinatra/base'
require 'sinatra/json'
require_relative './lib/shopping_cart.rb'
require_relative './lib/item.rb'
require_relative './lib/voucher.rb'

require 'byebug'

class NutmegClothing < Sinatra::Base
  set :root, File.dirname(__FILE__)
  
  set :shopping_cart, ShoppingCart.new
  set :stock_items  , Array.new(10) { Item.new(name: "Jeans", category: "Men's Casualwear", price: 1000, quantity: 5) }
  set :vouchers     , [] 
  alias_method :s, :settings

  helpers Sinatra::JSON

  get '/' do
    send_file "./app/views/index.html" 
  end

  # API

  get '/api/stock_items' do
    json settings.stock_items.map(&:extract)
  end

  get "/api/stock_items/:item_pid" do
    if item = Item.find_by(pid: params[:item_pid])
      json item.extract
    else
      json({ status: 400 })
    end
  end

  get "/api/shopping_carts/:id" do
    json s.shopping_cart.extract
  end

  post "/api/shopping_carts/:id/stock_items/:item_pid" do
    if item = Item.find_by(pid: params[:item_pid])
      settings.shopping_cart.add item
      200
    else
      400
    end
  end

  delete "/api/shopping_carts/:id/stock_items/:item_pid" do
    if item = settings.shopping_cart.remove(Item.find_by(pid: params[:item_pid]))
      200
    else
      400
    end
  end

  post "/api/shopping_carts/:id/vouchers/:id" do
    if voucher = settings.vouchers.find {|voucher| voucher.id == params[:id].to_i} 
      settings.shopping_cart.add_voucher(voucher)
      200
    else
      400
    end
  end

  get "/api/vouchers" do
    json settings.vouchers.map(&:extract)
  end

  run! if app_file == $0
end
