get '/' do
  current_user_id = session[:id]
  if current_user_id
    @current_user = User.find(current_user_id) 
  end
  erb :index
end

post '/' do
  user = User.where(username: params[:username], password: params[:password])[0]
  session[:id] = user.id if user
  redirect '/'
end

get '/signup' do
  erb :signup
end

post '/signup' do
  User.create(username: params[:username], password: params[:password])
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end
