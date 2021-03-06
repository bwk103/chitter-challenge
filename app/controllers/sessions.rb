class ChitterApp < Sinatra::Base

  get '/sessions/new' do
    erb(:'/sessions/new')
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:message] = 'Goodbye'
    redirect '/peeps'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.keep[:error] = ['The email or password is incorrect']
      redirect 'sessions/new'
    end
  end

end
