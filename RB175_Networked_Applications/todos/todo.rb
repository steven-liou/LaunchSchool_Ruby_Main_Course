require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "sinatra/content_for"

configure do
  enable :sessions
  set :session_secret, "good todo"
  set :erb, escape_html: true
end

before do
  session[:lists] ||= []
end

helpers do
  def list_complete?(list)
    todos_count(list) > 0 && remaining_todos_count(list) == 0
  end

  def todos_count(list)
    list[:todos].size
  end

  def remaining_todos_count(list)
    list[:todos].count { |list| !list[:completed] }
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

def load_list(list_number)
  list = session[:lists].find { |list| list[:id] == list_number } if list_number
  return list if list

  session[:error] = "The speficied list was not found."
  redirect "/lists"
end

def next_element(elements)
  max = elements.map { |element| element[:id] }.max || 0
  max + 1
end

get "/" do
  redirect "/lists"
end

# clear all todo lists
get "/clear" do
  session[:lists].clear
  redirect "/lists"
end

# view all the todo lists
get "/lists" do
  @lists = session[:lists]
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
  elsif session[:lists].any? { |list| list[:name] == name }
    "Todo list name must be unique"
  end
end

# create a new todo list
post "/lists" do
  @lists = session[:lists]
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)

  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    id = next_element(@lists)
    @lists << { id: id, name: list_name, todos: [] }
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
    @list[:name] = list_name
    session[:success] = "Todo list name has been updated."
    redirect "/lists/#{id}"
  end
end

# delete todo list
post "/lists/:id/destroy" do
  id = params[:id].to_i
  session[:lists].reject! { |list| list[:id] == id }

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
    id = next_element(@list[:todos])
    @list[:todos] << { id: id, name: todo_name, completed: false }
    session[:success] = "Todo item hss been added."
    redirect "/lists/#{@list_id}"
  end
end

# delete a todo item
post "/lists/:list_id/todos/:id/destroy" do
  @list_id = params[:list_id].to_i
  @list = load_list(@list_id)
  todo_id = params[:id].to_i

  @list[:todos].reject! { |todo| todo[:id] == todo_id }

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
  todo = @list[:todos].find { |todo| todo[:id] == todo_id }
  todo[:completed] = is_complete

  session[:success] = "Todo item status has been updated."
  redirect "/lists/#{@list_id}"
end

# complete all todo lists
post "/lists/:id/complete_all" do
  @list_id = params[:id].to_i
  @list = load_list(@list_id)

  @list[:todos].each do |todo|
    todo[:completed] = true
  end

  session[:success] = "All todo items have been completed!"
  redirect "/lists/#{@list_id}"
end
