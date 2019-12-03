class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  #管理者か確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to root_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  #def correct_space
  #  @space = Space.find(params[:id])
  #  redirect_to list_path unless @space == current_space
  #end

end
