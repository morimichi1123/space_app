class SessionsController < ApplicationController

  #def new
  #end
  #↑いらない説

  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])
      log_in user
      if current_user.admin?
        redirect_to root_path
      else
        redirect_to list_path
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end