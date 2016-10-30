class CompaniesController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end

  get '/companies' do
    if logged_in
      @user = current_user
      erb :'/companies/index'
    else
      redirect '/'
    end
  end

  get '/companies/new' do
    if logged_in
      erb :'/companies/new'
    else
      redirect '/'
    end
  end

  post '/companies' do
    if logged_in
      @user = current_user
      if !@user.companies.include?(Company.find_by(name: params[:name]))
        @company = @user.companies.new(name: params[:name], website: params[:website])
        if @company.save
          redirect to("/companies")
        else
          erb :error
        end
      else
        erb :error
      end
    else
      redirect '/'
    end
  end

  get '/companies/:slug' do
    if logged_in

    end
  end

end
