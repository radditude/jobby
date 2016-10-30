class PotentialJobsController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end

  get '/jobs' do
    erb :'/potential-jobs/index'
  end


end
