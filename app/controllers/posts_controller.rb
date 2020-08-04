class PostsController < ApplicationController
  before_action :set_post, except: %i[new create]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def users_posts
    # @posts = current_user.
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(posts_params)
  end

  def edit; end

  def update
    if @post.update(posts_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def show; end

  def destroy
    redirect_to posts_path if @post.destroy
  end

  private

  def posts_params
    params.require(:post).permit(:title, :describe)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
