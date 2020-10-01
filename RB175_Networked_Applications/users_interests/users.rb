require 'sinatra'
require 'sinatra/reloader'
require 'yaml'
require 'tilt/erubis'

before do
  @users = YAML.load_file("users.yaml")
end

helpers do
  def count_interests
    @users.reduce(0) do |interests, (_name, info)|
      info[:interests].size + interests
    end
  end
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :index
end

get "/users/:user_name" do
  @user_name = params[:user_name].to_sym
  @email = @users[@user_name][:email]
  @interests = @users[@user_name][:interests]
  erb :user
end
