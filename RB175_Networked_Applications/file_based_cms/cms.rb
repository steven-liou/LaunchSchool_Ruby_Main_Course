require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'

configure do
  enable :sessions
  set :session_secret, "cms secret"
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path('test/data', __dir__)
  else
    File.expand_path("data", __dir__)
  end
end

def load_file_content(file_path)
  content = File.read(file_path)

  case File.extname(file_path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    erb render_markdown(content)
  end
end

def user_signed_in?
  session.key?(:username)
end

def require_signed_in_user
  return if user_signed_in?
  session[:message] = "You must be signed in to do that."
  redirect "/"
end

def valid_credentials?(username, password)
  credentials = load_user_credentials
  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
                       File.expand_path('tests/users.yaml', __dir__)
                     else
                       File.expand_path('users.yaml', __dir__)
                     end
  YAML.load_file(credentials_path)
end

get "/" do
  files_path = File.join(data_path, "*")
  @files = Dir.glob(files_path).map { |file| File.basename(file) }.sort
  erb :index
end

# render the new document form
get "/new" do
  require_signed_in_user
  erb :new
end

# create a new document
post "/create" do
  require_signed_in_user

  filename = params[:filename]

  if filename.strip.empty?
    session[:message] = "A name is required"
    status 422
    erb :new
  else
    file_path = File.join(data_path, filename)
    File.write(file_path, "")
    session[:message] = "#{filename} has been created."
    redirect "/"
  end
end

# display the file
get "/:filename" do
  filename = params[:filename]
  file_path = File.join(data_path, File.basename(filename))
  if File.file?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{filename} does not exist."
    redirect "/"
  end
end

# render the edit document form
get "/:filename/edit" do
  require_signed_in_user
  @filename = params[:filename]
  file_path = File.join(data_path, @filename)
  @content = File.read(file_path)
  erb :edit
end

# edit the document
post "/:filename" do
  require_signed_in_user

  filename = params[:filename]
  file_path = File.join(data_path, filename)
  File.write(file_path, params[:content])
  session[:message] = "#{filename} has been updated."
  redirect "/"
end

# delete the document
post "/:filename/delete" do
  require_signed_in_user

  filename = params[:filename]
  file_path = File.join(data_path, filename)
  File.delete(file_path)
  session[:message] = "#{filename} has been deleted."
  redirect "/"
end

# render sign in form
get "/users/signin" do
  erb :signin
end

# sign in a user
post "/users/signin" do
  credentials = load_user_credentials
  username = params[:username]
  password = params[:password]

  if valid_credentials?(username, password)
    session[:username] = username
    session[:message] = "Welcome!"
    redirect "/"
  else
    session[:message] = "Invalid credentials."
    status 422
    erb :signin
  end
end

# sign out a user
post "/users/signout" do
  session.delete(:username)
  session[:message] = "You have been signed out."
  redirect "/"
end
