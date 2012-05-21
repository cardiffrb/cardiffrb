class UsersController < ApplicationController

  def index
    @users = User.all.sort { rand }
  end

  def destroy
    @user = User.find(session[:user_id]) if session[:user_id]
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Removed from cardiffrb"
  end

end
