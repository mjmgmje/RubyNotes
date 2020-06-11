class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
    if(logged_in?) then
      redirect_to "/notes"
    end
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/notes'
    else
        redirect_to '/login'
    end
  end

  def login    
  end

  def logout      
    session[:user_id] = nil
    redirect_to '/login'
  end

  def welcome
  end

  def page_requires_login
  end
end
