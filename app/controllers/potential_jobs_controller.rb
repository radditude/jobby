class PotentialJobsController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end

  get '/potentialjobs' do
    erb :'/potential-jobs/index'
  end

  get '/potentialjobs/new' do
    erb :'/potential-jobs/new'
  end

  post '/potentialjobs' do
    if params["new_company"].empty? && !params["company"]
      redirect '/error'
    elsif !params[:new_company].empty?
      @company = current_user.companies.find_or_create_by(name: params[:new_company])
    else
      @company = current_user.companies.find_by_id(params[:company])
    end

    if @company.potential_jobs.create(params[:info])
      redirect '/potentialjobs'
    else
      redirect '/error'
    end
  end

  get '/potentialjobs/:id' do
    erb :'/potential-jobs/show'
  end

  get '/potentialjobs/:id/edit' do
    erb :'/potential-jobs/edit'
  end

  patch '/potentialjobs/:id' do
    if params["new_company"].empty? && !params["company"]
      redirect '/error'
    elsif !params[:new_company].empty?
      @company = current_user.companies.find_or_create_by(name: params[:new_company])
    else
      @company = current_user.companies.find_by_id(params[:company])
    end

    if current_job.update(params[:info])
      redirect to("/potentialjobs/#{current_job.id}")
    else
      redirect '/error'
    end
  end

  delete '/potentialjobs/:id' do
    current_job.destroy
    redirect '/'
  end

  helpers do
    def current_job
      current_user.potential_jobs.find_by_id(params[:id])
    end
  end


end
