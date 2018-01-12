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
    @peep = Peep.new(content: params[:content], time_posted: Time.now)
    @peep.save
    redirect '/peeps'
  end
end
