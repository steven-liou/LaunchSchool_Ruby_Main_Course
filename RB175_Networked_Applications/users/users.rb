require 'sinatra'
require 'sinatra/reloader'
require 'yaml'
require 'tilt/erubis'

before do
  @users = YAML.load_file('users.yaml')
end

helpers do
  def count_interests
    @users.reduce(0) {|interests, (_, info)| interests + info[:interests].size }
  end
end

get '/' do
 redirect '/users' 
end

get '/users' do
  erb :users
end

get '/users/:user_name' do
  @user_name = params[:user_name].to_sym
  @email = @users[@user_name][:email]
  @intnerests = @users[@user_name][:intnerests]
  erb :user
end
