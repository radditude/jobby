class UsersController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end

  get '/signup' do
    if logged_in
      redirect '/'
    else
      erb :'/users/new'
    end
  end

  post '/signup' do
    if logged_in
      redirect '/'
    else
      user = User.new(params)
      if user.save
        session[:user_id] = user.id
        redirect '/'
      else
        redirect '/error'
      end
    end
  end

  get '/login' do
    if logged_in
      redirect '/'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
      if logged_in
        redirect '/'
      else
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to '/'
        else
          erb :'/application/error'
        end
      end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


  get '/user' do
    erb :'/users/show'
  end

  get '/user/edit' do
    erb :'/users/edit'
  end

  patch '/user' do
    if current_user.update(params[:user])
      redirect to("/user")
    else
      redirect to("/user/edit")
    end
  end

  get '/delete' do
    erb :'/users/delete'
  end

  delete '/user' do
    current_user.destroy
    redirect '/'
  end

end
