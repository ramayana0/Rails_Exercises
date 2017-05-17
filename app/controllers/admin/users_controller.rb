class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.update_attributes params[:user].permit(:firstName, :lastName, :age, :email, :password)
    if @user.save
      redirect_to [:admin, @user]
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes params[:user].permit(:firstName, :lastName, :age, :email, :password)
    if @user.save
      redirect_to [:admin, @user]
    else
      render "edit"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    if User.find(params[:id]).destroy
      redirect_to admin_users_url
    end
  end

end
