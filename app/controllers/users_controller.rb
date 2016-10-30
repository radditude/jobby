class UsersController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end

  get '/signup' do
    if !logged_in
      erb :'/users/new'
    else
      redirect '/jobs'
    end
  end

  post '/signup' do
    if logged_in
      redirect '/jobs'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect to '/jobs'
      else
        erb :error
      end
    end
  end

  get '/login' do
    if logged_in
      redirect to '/jobs'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
      if logged_in
        redirect to '/jobs'
      else
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect to '/jobs'
        else
          erb :error
        end
      end
  end

  get '/logout' do
    if logged_in
      session.clear
      redirect '/'
    else
      redirect '/'
    end
  end

  get '/user/:id' do
    if logged_in
      @user = current_user
      erb :'/users/show'
    else
      redirect '/'
    end
  end

end
