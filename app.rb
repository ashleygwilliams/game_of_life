require "bundler"
Bundler.require

require './lib/game'

class Game_of_Life < Sinatra::Application

  enable :sessions

  configure(:development) { set :session_secret, "something" }

  get "/" do
    session[:game] ||= Game.new
    session[:game].play

    haml :game
  end

end