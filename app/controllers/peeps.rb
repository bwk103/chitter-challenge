class ChitterApp < Sinatra::Base
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
    @user = User.first(id: session[:user_id])
    @peep = Peep.create(content: params[:content], time_posted: Time.now)
    @user.peeps << @peep
    @user.save
    redirect '/peeps'
  end
end
