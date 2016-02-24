# This controller is for all the CRUD operations related to a User.

MyApp.get "/new_user_form" do
  erb :"/users/new_user_form"
end

MyApp.post "/new_user_created" do
  @user = User.new
  @user.name = params["name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  erb :"/users/create_success"
end

MyApp.get "/user_list" do
  @users = User.all
  erb :"/users/user_list"
end

MyApp.get "/edit_user_form/:user_id" do
  @user = User.find_by_id(params[:user_id])
  erb :"/users/edit_user_form"
end

MyApp.post "/user_updated/:user_id" do 
  @user = User.find_by_id(params[:user_id])
  @user.name = params["name"]
  @user.email = params["email"]
  @user.password = params["password"]
  @user.save
  erb :"/users/updated"
end