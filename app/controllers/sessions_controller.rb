get "/" do
  erb :'index'
end

get "/login" do
  erb :'sessions/login'
end

post "/sessions" do
  user = User.find_by(username: params[:user][:username])
  if user && user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect "/items"
  else
    @message = "your username or password was entered incorrectly"
    erb :'sessions/login'
  end
end

delete "/sessions" do
  session[:user_id] = nil
  redirect ("/")
end