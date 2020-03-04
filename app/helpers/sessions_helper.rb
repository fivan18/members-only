module SessionsHelper
  def login_user(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
    redirect_to root_path
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
end
