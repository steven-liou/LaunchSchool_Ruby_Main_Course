require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'sinatra/content_for'

configure do
  enable :sessions
  set :session_secret, 'contacts'
end

before do
  session[:contacts] ||= {
    "Family" => [],
    "Friends" => [],
    "Work" => []
  }
end

get "/" do
  redirect "/contacts"
end

get "/contacts" do
  @contacts = session[:contacts]
  erb :contacts
end

# render new contact form
get "/contacts/create" do
  erb :new_contact
end

# view the specific contact group page
get "/contacts/:group" do
  @people = session[:contacts][params[:group]]
  erb :group
end

# return the error message for new contact if invalid, else return nil
def error_for_new_contact(group, name)
  if !session[:contacts].key?(group)
    "Invalid group name"
  elsif !(1..100).cover?(name.length)
    "Person name must be between 1 and 100 characters"
  elsif session[:contacts][group].any? { |person| person[:name] == name }
    "Person name must be unique"
  end
end

# create new contact
post "/contacts/create" do
  group = params[:group]
  name = params[:name]

  error = error_for_new_contact(group, name)

  if error
    session[:message] = error
    erb :new_contact
  else
    session[:contacts][group] << { name: name, telephone: "", address: "", email: "" }
    session[:message] = "New contact has been added"
    redirect "/contacts"
  end
end

# render edit contact form
get "/contacts/:group/:id/edit" do
  id = params[:id].to_i
  @name = session[:contacts][params[:group]][id][:name]
  @telephone = session[:contacts][params[:group]][id][:telephone]
  @address = session[:contacts][params[:group]][id][:address]
  @email = session[:contacts][params[:group]][id][:email]
  erb :edit
end

# edit contact
post "/contacts/:group/:id/edit" do
  id = params[:id].to_i
  session[:contacts][params[:group]][id][:telephone] = params[:telephone]
  session[:contacts][params[:group]][id][:address] = params[:address]
  session[:contacts][params[:group]][id][:email] = params[:email]
  session[:message] = "Contact information has been updated"
  redirect "/contacts/#{params[:group]}"
end

# delete contact
post "/contacts/:group/:id/delete" do
  id = params[:id].to_i
  session[:contacts][params[:group]].delete_at(id)
  session[:message] = "Contact has been deleted"
  redirect "/contacts/#{params[:group]}"
end
