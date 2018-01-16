class ChitterApp < Sinatra::Base
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    @users = User.all.sample(10)
    erb(:'peeps/index')
  end

  get '/peeps/new' do
    if current_user
      erb(:'peeps/new')
    else
      flash[:message] = 'You must be signed in to post a Peep'
      redirect '/peeps'
    end
  end

  post '/peeps' do
    @user = User.first(id: session[:user_id])
    @peep = Peep.create(content: params[:content], time_posted: Time.now)
    @user.peeps << @peep
    @user.save
    redirect '/peeps'
  end
end
