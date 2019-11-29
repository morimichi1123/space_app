class UsersController < ApplicationController
  before_action :admin_user, only: %i[ destroy]
  before_action :logged_in_user, only: %i[ edit update]
  before_action :correct_user, only: %i[ edit update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Space App!"
      redirect_to list_path
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to userlist_path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Your Information Updated"
      redirect_to list_path
    else
      render 'edit'
    end
  end

  def list
    @user = User.paginate(page: params[:page]).search(params[:search])
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end
end