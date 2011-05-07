class UsersController < ApplicationController
  def index
    @users = User.all
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def destroy
    @user = User.find(session[:user_id]) if session[:user_id]
    @user.destroy

    respond_to do |format|
      format.html {
        session[:user_id] = nil
        redirect_to root_url
      }
    end
  end

end
