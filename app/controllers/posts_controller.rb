class PostsController < ApplicationController
  before_action :require_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
  end

  def index
  end

  private
  def require_user
    redirect_to signin_path unless logged_in?
  end
end
