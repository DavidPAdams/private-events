module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    remember(user)
    current_user
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_digest] = user.remember_digest
  end

  def current_user?(user)
    user == current_user
  end

  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        @current_user = user
      end
    else
      nil
    end
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil    
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
      flash[:error] = "Please sign in"
      redirect_to login_path
    end    
  end

end
