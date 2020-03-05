module SessionsHelper
  def login_user(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def logout
    current_user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    redirect_to root_path
  end

  def current_user
    if (user_id = cookies.signed[:user_id])
      User.find_by(id: user_id)
      @current_user = user if user&.authenticated?(cookies[:remember_token])
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
