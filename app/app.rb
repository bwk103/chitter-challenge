require 'sinatra/base'

class ChitterApp < Sinatra::Base

  get '/' do
    'Hello world'
  end

end
