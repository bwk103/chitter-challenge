ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

require_relative 'data_mapper_setup'

class ChitterApp < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  post '/peeps' do
    @peep = Peep.new(content: params[:content], time_posted: Time.now)
    @peep.save
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      redirect '/users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
