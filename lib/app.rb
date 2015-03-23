require 'sinatra/base'

class NutmegClothing < Sinatra::Base
  get '/' do
    'Hello NutmegClothing!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
