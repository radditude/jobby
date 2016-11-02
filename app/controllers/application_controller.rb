require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end

  before do
   pass if ["login", "signup", nil].include? request.path_info.split('/')[1]
   if !logged_in
     redirect '/'
   end
 end

  get "/" do
    if logged_in
      erb :'/application/home'
    else
      erb :'/application/welcome'
    end
  end

  get '/error' do
    erb :'/application/error'
  end

  helpers do
    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in
      !!current_user
    end
  end

end
