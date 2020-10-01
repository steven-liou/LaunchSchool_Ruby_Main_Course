require "sinatra"
require "tilt/erubis"
require "sinatra/content_for"
require_relative "database_persistence"

configure do
  enable :sessions
  set :session_secret, "good todo"
  set :erb, escape_html: true
end

configure(:development) do
  require "sinatra/reloader"
  also_reload "database_persistence.rb"
end

before do
  @storage = DatabasePersistence.new(logger)
end

helpers do
  def list_complete?(list)
    todos_count(list) > 0 && remaining_todos_count(list) == 0
  end

  def todos_count(list)
    list[:todos].size
  end

  def remaining_todos_count(list)
    list[:todos].count { |todo| !todo[:completed] }
  end

  def list_class(list)
    "complete" if list_complete?(list)
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| list_complete?(list) }

    incomplete_lists.each(&block)
    complete_lists.each(&block)
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo[:completed] }

    incomplete_todos.each(&block)
    complete_todos.each(&block)
  end
end

def load_list(id)
  list = @storage.find_list(id)
  return list if list

  session[:error] = "The speficied list was not found."
  redirect "/lists"
end

get "/" do
  redirect "/lists"
end

# clear all todo lists
get "/clear" do
  @storage.all_lists.clear
  redirect "/lists"
end

# view all the todo lists
get "/lists" do
  @lists = @storage.all_lists
  erb :lists, layout: :layout
end

# render the form to create a new list
get "/lists/new" do
  erb :new_list, layout: :layout
end

# return the error message for invalid todo list name, else return nil
def error_for_list_name(name, current_name=nil)
  return if name && name == current_name
  if !(1..100).cover?(name.length)
    "Todo list name must be between 1 and 100 characters"
  elsif @storage.all_lists.any? { |list| list[:name] == name }
    "Todo list name must be unique"
  end
end

# create a new todo list
post "/lists" do
  @lists = @storage.all_lists
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)

  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    @storage.create_new_list(list_name)
    session[:success] = "Todo list has been created"
    redirect "/lists"
  end
end

# view a single todo list
get "/lists/:id" do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)
  erb :list, layout: :layout
end

# render the edit existing todo list page
get "/lists/:id/edit" do
  id = params[:id].to_i
  @list = load_list(id)
  erb :edit_list, layout: :layout
end

# edit the todo list name
post "/lists/:id" do
  id = params[:id].to_i
  @list = load_list(id)
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name, @list[:name])

  if error
    session[:error] = error
    erb :edit_list, layout: :layout
  else
    @storage.update_list_name(id, list_name)
    session[:success] = "Todo list name has been updated."
    redirect "/lists/#{id}"
  end
end

# delete todo list
post "/lists/:id/destroy" do
  id = params[:id].to_i
  @storage.delete_list(id)

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    "/lists"
  else
    session[:success] = "Todo list has been deleted!"
    redirect "/lists"
  end
end

def error_for_todo_item(name)
  return if (1..100).cover?(name.length)
  "Todo item name must be between 1 and 100 characters."
end

# create a todo item
post "/lists/:list_id/todos" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  todo_name = params[:todo].strip

  error = error_for_todo_item(todo_name)

  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @storage.create_new_todo(@list_id, todo_name)
    session[:success] = "Todo item hss been added."
    redirect "/lists/#{@list_id}"
  end
end

# delete a todo item
post "/lists/:list_id/todos/:id/destroy" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  todo_id = params[:id].to_i

  @storage.delete_todo_from_list(@list_id, todo_id)

  if env["HTTP_X_REQUESTED_WITH"] == "XMLHttpRequest"
    status 204
  else
    session[:success] = "Todo item has been deleted"
    redirect "/lists/#{@list_id}"
  end
end

# mark a todo item as complete
post "/lists/:list_id/todos/:id" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  todo_id = params[:id].to_i
  is_complete = params[:completed] == "true"

  @storage.update_todo_status(@list_id, todo_id, is_complete)

  session[:success] = "Todo item status has been updated."
  redirect "/lists/#{@list_id}"
end

# complete all todo lists
post "/lists/:id/complete_all" do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)

  @storage.mark_all_todos_as_comppleted(@list_id)

  session[:success] = "All todo items have been completed!"
  redirect "/lists/#{@list_id}"
end
