enable :sessions

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post "/" do
  puts params
  @user = User.create(params[:user])
#this creates a user
#IF THE user is not authenticeated shoe erb :index
#create new session
#If they're authenticated redirect "/secret"
end

post "/login" do
  if User.authenticate(params[:password], params[:email])
    user = User.find_by_email(params[:email])
    session[:user_id] = user.id
    redirect "/secret"
  else
    erb :index
  end
 #authenticate exisiting user
 #IF THE user is not authenticeated shoe erb :index
 #create new session
#If they're authenticated redirect "/secret"
end


get "/logout" do 
  session.clear
  redirect "/"
end



get "/secret" do
   if logged_in?
    erb :secret
  else
    redirect "/"
  end
end
