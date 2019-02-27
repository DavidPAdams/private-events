class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{@user.name}, you are now logged in"
      redirect_to root_path
    else
      flash.now[:danger] = "Try again with another name"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil 
    redirect_to root_url
  end
end
