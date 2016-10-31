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
        binding.pry
      end
      contact = @company.contacts.new(name: params[:name], email: params[:email], phone_number: params[:phone_number])
      if contact.save
        redirect '/contacts'
      else
        erb :error
      end
    else
      redirect '/'
    end
  end


end
