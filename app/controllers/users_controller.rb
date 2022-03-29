class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new 
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      cookies.signed[:user_id] = @user.id
      redirect_to chatroom_path
    else
      flash[:error] = "Oops try that again.."
    end
  end

  def show 
    @user = User.find(params[:id])
  end

  private

  def user_params 
    params.require(:user).permit(:username, :password)
  end
end
