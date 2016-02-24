# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.

MyApp.get "/" do
  erb :"/homepage/homepage"
end

MyApp.get "/login" do
  erb :"/logins/login"
end

MyApp.get "/login_attempt" do
  @user = User.find_by_email(params[:email])
   
   if @user != nil && @user.password == params[:password] 

    session["user_id"] = @user.id

    erb :"/logins/login_success"
  else
    erb :"/logins/login_fail"
  end
end

MyApp.get "/logout" do
  session["user_id"] = nil
  erb :"logins/logout"
end