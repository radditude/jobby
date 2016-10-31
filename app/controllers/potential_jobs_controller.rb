class PotentialJobsController < ApplicationController

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "difficult_passphrase"
  end

  get '/potentialjobs' do
    if logged_in
      @user = current_user
      erb :'/potential-jobs/index'
    else
      redirect '/'
    end
  end

  get '/potentialjobs/new' do
    if logged_in
      @user = current_user
      erb :'/potential-jobs/new'
    else
      redirect '/'
    end
  end

  post '/potentialjobs' do
    if logged_in
      @user = current_user
      if params[:new_company] == ""
        if params[:company] == ""
          erb :error
        else
          @company = @user.companies.find_by_id(params[:company])
        end
      else
        @company = @user.companies.create(name: params[:new_company])
      end
      job = @company.potential_jobs.new(job_title: params[:job_title], link: params[:link], status: params[:status])
      if job.save
        redirect '/potentialjobs'
      else
        erb :error
      end
    else
      redirect '/'
    end
  end


end
