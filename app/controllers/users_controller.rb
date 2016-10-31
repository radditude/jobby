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
      redirect '/potentialjobs'
    end
  end

  post '/signup' do
    if logged_in
      redirect '/jobs'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect to '/potentialjobs'
      else
        erb :error
      end
    end
  end

  get '/login' do
    if logged_in
      redirect to '/potentialjobs'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
      if logged_in
        redirect to '/potentialjobs'
      else
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect to '/potentialjobs'
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

  get '/user' do
    if logged_in
      @user = current_user
      erb :'/users/show'
    else
      redirect '/'
    end
  end

  get '/user/edit' do
    if logged_in
      @user = current_user
      erb :'/users/edit'
    else
      redirect '/'
    end
  end

  patch '/user' do
    if logged_in
      @user = current_user
      @user.username = params[:username]
      @user.email = params[:email]
      if @user.save
        redirect to("/user/#{@user.id}")
      else
        redirect to("/user/#{@user.id}/edit")
      end
    else
      redirect '/'
    end
  end

  delete '/user' do
    if logged_in
      user = current_user
      user.destroy
      redirect '/'
    else
      redirect '/'
    end
  end

end
