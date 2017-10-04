class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures/new' do
  #  binding.pry
     @figure = Figure.create(name: params["figure"]["name"])

     if params["title"]["name"] != ""
       @title = Title.create(name: params["title"]["name"])
       FigureTitle.create(figure_id: @figure.id, title_id: @title.id)
       @figure.titles << @title
     end

     if params["figure"]["title_ids"] != nil
       params["figure"]["title_ids"].each do |ft|
        @title = Title.find_by(name: params["figure"]["title_ids"])
        FigureTitle.create(figure_id: @figure.id,
        title_id: @title.id)
        @figure.titles << @title
       end
     end

     if params["landmark"]["name"] != ""
       @landmark = Landmark.create(name: params["landmark"]["name"])
       if params["landmark"]["year_completed"] != ""
         @landmark.year_completed = params["landmark"]["year_completed"]
         @landmark.save
       end
       @figure.landmarks << @landmark
     end

     if params["figure"]["landmark_ids"] != nil
       @figure.landmarks = []
       params["figure"]["landmark_ids"].each do |lm|
        @landmark = Landmark.find_by(name: lm)
        @figure.landmarks << @landmark
      end
     end

   end

   get '/figures/:id' do
     @figure = Figure.find_by(params[:id])
     @landmark = Landmark.find_by(figure_id: @figure.id)
     erb :'figures/show'
   end

   get '/figures/:id/edit' do
     @figure = Figure.find(params[:id])
     erb :'figures/edit'
   end

   post '/figures/:id' do
     #binding.pry
     @figure = Figure.find(params[:id])
     @figure.name = params["figure"]["name"]
     @landmark = Landmark.find_by(figure_id: @figure.id)
     @landmark.name = params["landmark"]["name"]
     @landmark.save
     @figure.save
     redirect "/figures/#{@figure.id}"
   end



end
