class PostsController < ApplicationController
  before_action :set_post, except: %i[index new create]
  before_action :authenticate_user!, only: %i[down_vote up_vote]

  def index
    @posts = Post.order(created_at: :desc).decorate
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(posts_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(posts_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def show
    @commentable = @post
    @comments = @commentable.comments
  end

  def destroy
    redirect_to posts_path if @post.destroy
  end

  def down_vote
    @post.downvote_from(current_user)
    redirect_back(fallback_location: root_path)
  end

  def up_vote
    @post.liked_by(current_user)
    redirect_back(fallback_location: root_path)
  end

  private

  def posts_params
    params.require(:post).permit(:title, :describe)
  end

  def set_post
    @post = Post.find(params[:id]).decorate
  end
end
