class CompaniesController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end

  get '/companies' do
    erb :'/companies/index'
  end


end
