get '/sessions' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user.password.authenticate(params[:password])
    session[:id] = @user.id
    session[:name] = @user.full_name
  else
    # perhaps error message here
    redirect '/sessions/new'
  end
end

delete '/sessions/:id' do
  sesion[:id] = nil
  session[:name] = nil
  redirect '/sessions/new'
end
