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