class UsersController < ApplicationController
  
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def newAdmin
    @user = User.new
  end

  def create
    userNew = params.require(:user).permit(:username, :password)
    userNew[:user_role] = "teamMember"
    @user = User.create(userNew)
    session[:user_id] = @user.id
    redirect_to '/notes'
  end

  def createAdmin
    userNew = {}
    userNew[:username] = params.require(:username)
    userNew[:password] = params.require(:password)
    if(params.has_key?(:user_role)) then
      userNew[:user_role] = params.require(:user_role)
      if(userNew[:user_role]) then
        userNew[:user_role] = "admin"
      else
        userNew[:user_role] = "teamMember"
      end
    else
      userNew[:user_role] = "teamMember"
    end
    @user = User.create(userNew)
    redirect_to '/user/index'
  end

  def index
    if admin?
      @users = User.all
    else
      redirect_to "/notes"
    end
  end

 
  def destroy
    @user = User.find(params[:id])
    Note.where(:user_id => params[:id]).destroy_all
    @user.destroy

    respond_to do |format|
      format.html { redirect_to index, notice: 'User was deleted succesfully'}
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end
  
  def updateView
    @user = User.find(params[:id])
  end

  def update
    userOld = User.find(params[:id])
    userNew = {}
    userNew[:username] = params.require(:username)
    userNew[:password] = params.require(:password)
    if(params.has_key?(:user_role)) then
      userNew[:user_role] = params.require(:user_role)
    end
    userOld.update(userNew)
    redirect_to '/user/index'
  end

end

