class CompaniesController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end

  get '/companies' do
    if logged_in
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
      if !@current_user.companies.include?(Company.find_by(name: params[:name]))
        @company = @current_user.companies.new(name: params[:name], website: params[:website])
        if @company.save
          redirect to("/companies")
        else
          erb :'/application/error'
        end
      else
        erb :'/application/error'
      end
    else
      redirect '/'
    end
  end

  get '/companies/:slug' do
    if logged_in
      @company = @current_user.companies.find_by_slug(params[:slug])
      erb :'/companies/show'
    else
      redirect '/'
    end
  end
  
  get '/companies/:slug/edit' do
    if logged_in
      @company = current_user.companies.find_by_slug(params[:slug])
      erb :'/companies/edit'
    else
      redirect '/'
    end
  end
  
  patch '/companies/:slug' do
    if logged_in
      @company = current_user.companies.find_by_slug(params[:slug])
      if @company.update(name: params[:name], website: params[:website])
        redirect to("/companies/#{@company.slug}")
      else
        erb :'/application/error'
      end
    else
      redirect '/'
    end
  end
  
  delete '/companies/:slug' do
    if logged_in
      @company = current_user.companies.find_by_slug(params[:slug])
      @company.destroy
      redirect '/companies'
    else
      redirect '/'
    end
  end

end
