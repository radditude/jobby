class ContactsController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end
  
  get '/contacts' do
    if logged_in
      @user = current_user
      erb :'/contacts/index'
    else
      redirect '/'
    end
  end
  
  get '/contacts/new' do
    if logged_in
      @user = current_user
      erb :'/contacts/new'
    else
      redirect '/'
    end
  end
  
  post '/contacts' do
    
  end


end
