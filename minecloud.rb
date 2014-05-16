require 'sinatra'
require 'sinatra/base'
require 'magi/api'
require 'aws-sdk-core'

helpers do
  def play
    connection = Aws.ec2
    api = Magi::Api.new
    ami = api.search(connection, 'minecraft').first[0]
    api.deploy(connection, ami)
  end

  def stop(instance_id)
    connection = Aws.ec2
    api = Magi::Api.new
    api.terminate( connection, instance_id )
    erb :stop
  end
end

get '/' do
  erb :index
end

get '/play' do
  @game_data = play
  erb :play
end

get '/stop/:instance_id' do |instance_id|
  stop(instance_id)
  erb :stop
end
