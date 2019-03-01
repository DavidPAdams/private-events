class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome to the party zone!"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = current_user.upcoming_events
    @prev_events = current_user.previous_events
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
