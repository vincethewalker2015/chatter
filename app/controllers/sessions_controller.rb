class SessionsController < ApplicationController
  # before_action :logged_in_redirect, only: [:new, :create] 
  def new

  end

  def create 
    user = User.find_by(username: params[:session][:username].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        cookies.signed[:user_id] = user.id
        redirect_to chatroom_path
      else
        flash.now[:error] = "That didn't work! Try again"
        render 'new'
      end
  end

  def destroy 
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def logged_in_redirect 
    if logged_in?
      flash[:error] = "You are already logged in"
      redirect_to root_path
    end
  end

end
