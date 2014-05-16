require 'sinatra'
require 'sinatra/base'

helpers do
  def play
    '33.44.55.66'
  end
end

get '/' do
  erb :index
end

get '/play' do
  @ip = play
  erb :play
end

get '/stop' do
  erb :stop
end
