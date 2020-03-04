class PostsController < ApplicationController
  before_action :require_user, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params_post)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index; end

  private

  def params_post
    params.require(:post).permit(:title, :body)
  end

  def require_user
    redirect_to signin_path unless logged_in?
  end
end
