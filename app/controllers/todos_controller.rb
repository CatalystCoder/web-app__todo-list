# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/new_todo_form" do
  erb :"/todos/new_todo_form"
end

MyApp.post "/new_todo" do
  @todo = Todo.new
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.save
  erb :"/todos/create_success"
end

MyApp.get "/todos_list" do
  @todo = Todo.all
  erb :"todos/todo"
end

MyApp.get "/edit_todo_form/:todo_id" do
  @todo = Todo.find_by_id(params[:todo_id])
  erb :"todos/edit_todo_form"
end

MyApp.post "/edit_todo/:todo_id" do
  @todo = Todo.find_by_id(params[:todo_id])
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.save
  erb :"/todos/updated"
end

MyApp.post "/delete_todo/:todo_id" do
  @todo = Todo.find_by_id(params[:todo_id])
  @todo.delete
  erb :"/todos/deleted"
end

MyApp.get "/todo_page/:todo_id" do 
  @todo = Todo.find_by_id(params[:todo_id])
  erb :"/todos/todo_page"
end


MyApp.get "/todo" do
  @user = User.find_by_id(session["user_id"])
    if @user != nil
      erb :"/todos/todo"
    else
      erb :"/logins/login"
    end 
end