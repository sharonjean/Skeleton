get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.create(first_name: params[:first_name], last_name: params[:last_name], user_name: params[:user_name], email: params[:email], password: params[:password])
  if @user.valid?
    session[:id] = @user.id
    session[:name] = @user.full_name
    redirect '/users'
  else
    redirect '/users/new'
  end
end














# get '/users/:id' do
#   @user = User.find(params[:id])
#   erb :'/users/:id'
# end

# get '/users/:id/edit' do
#   erb :'/users/edit'
# end

# put '/users/:id' do

# end

# delete '/users/:id' do

# end
