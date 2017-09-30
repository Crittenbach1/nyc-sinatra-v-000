class FiguresController <ApplicationController

  get '/figures' do
    @figures = Figures.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  post '/figures/new' do

  end

end
