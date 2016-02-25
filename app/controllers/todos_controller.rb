# This controller is for all the CRUD operations related to a Todo.

MyApp.before "/todos*" do
  @user = User.find_by_id(session["user_id"])
    if @user == nil
      redirect "/login"
    end
  end

MyApp.get "/new_todo_form" do
  @users = User.all
  @priorities = Priority.all
  erb :"/todos/new_todo_form"
end

MyApp.post "/new_todo" do
  @todo = Todo.new
  @todo.title = params["title"]
  @todo.description = params["description"]
  @todo.priority_id = params["priority_id"]
  @todo.user_id = params["user_id"]
  @todo.creator_id = session["user_id"]
  
  @todo.completed = false
  @todo.save

  redirect "/todos/list"
  
end

MyApp.get "/todos/list" do
  @todo = Todo.all
  erb :"todos/todo"
end

MyApp.get "/todos/edit/form/:todo_id" do
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
