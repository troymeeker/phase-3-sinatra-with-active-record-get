class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/games' do
    #get all games from database
    #return a JSON resp w arr of all the game data
    games = Game.all.order(:title)
    games.to_json
  end

  get '/games/:id' do 
    game = Game.find(params[:id])
    game.to_json(include: {reviews: {include: :user} })
  end

end
