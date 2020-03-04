class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      login_user(user)
      puts "you've been logged in "
    # redirect_to user_path
    else
      puts 'Error email or password not incorrect'
      redirect_to 'new'
    end
  end

  def destroy
    logout
  end
end
