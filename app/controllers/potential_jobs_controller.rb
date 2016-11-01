class PotentialJobsController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end

  get '/potentialjobs' do
    if logged_in
      erb :'/potential-jobs/index'
    else
      redirect '/'
    end
  end

  get '/potentialjobs/new' do
    if logged_in
      erb :'/potential-jobs/new'
    else
      redirect '/'
    end
  end

  post '/potentialjobs' do
    if logged_in
      if params[:new_company] == ""
        if params[:company] == ""
          erb :'/application/error'
        else
          @company = @current_user.companies.find_by_id(params[:company])
        end
      else
        @company = @current_user.companies.create(name: params[:new_company])
      end
      job = @company.potential_jobs.new(job_title: params[:job_title], link: params[:link], status: params[:status])
      if job.save
        redirect '/potentialjobs'
      else
        erb :'/application/error'
      end
    else
      redirect '/'
    end
  end

  get '/potentialjobs/:id' do
    if logged_in
      @job = @current_user.potential_jobs.find_by_id(params[:id])
      erb :'/potential-jobs/show'
    else
      redirect '/'
    end
  end

  get '/potentialjobs/:id/edit' do
    if logged_in
      @job = @current_user.potential_jobs.find_by_id(params[:id])
      erb :'/potential-jobs/edit'
    else
      redirect '/'
    end
  end

  patch '/potentialjobs/:id' do
    if logged_in
      if params[:new_company] == ""
        if params[:company] == ""
          erb :'/application/error'
        else
          @company = @current_user.companies.find_by_id(params[:company])
        end
      else
        @company = @current_user.companies.create(name: params[:new_company])
      end
      job = @company.potential_jobs.find_by_id(params[:id])
      if job.update(job_title: params[:job_title], link: params[:link], status: params[:status])
        redirect '/potentialjobs'
      else
        erb :'/application/error'
      end
    else
      redirect '/'
    end
  end

  delete '/potentialjobs/:id' do
    if logged_in
      job = @current_user.potential_jobs.find_by_id(params[:id])
      job.destroy
      redirect '/'
    else
      redirect '/'
    end
  end


end
