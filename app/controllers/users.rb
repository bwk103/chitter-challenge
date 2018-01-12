class ChitterApp < Sinatra::Base

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

end
