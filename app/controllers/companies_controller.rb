require 'pry'
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

  get '/companies/new' do
    erb :'/companies/new'
  end

  post '/companies' do
    if current_user.companies.find_or_create_by(params)
      redirect to("/companies")
    else
      redirect '/error'
    end
  end

  get '/companies/:slug' do
    erb :'/companies/show'
  end

  get '/companies/:slug/edit' do
    erb :'/companies/edit'
  end

  patch '/companies/:slug' do
    company = current_company
    if company.update(params[:info])
      redirect to("/companies/#{company.slug}")
    else
      redirect '/error'
    end
  end

  delete '/companies/:slug' do
    current_company.destroy
    redirect '/companies'
  end

  helpers do
    def current_company
      current_user.companies.find_by_slug(params[:slug])
    end
  end

end
