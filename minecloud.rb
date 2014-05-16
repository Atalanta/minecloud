require 'sinatra'
require 'sinatra/base'
require 'magi/api'
require 'aws-sdk-core'

helpers do
  def play
    connection = Aws.ec2
    api = Magi::Api.new
    ami = api.search(connection, 'minecraft').first[0]
    @ip = api.deploy(connection, ami)['ip']
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
