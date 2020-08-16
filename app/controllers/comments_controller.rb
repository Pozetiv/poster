class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :find_comment, only: %i[edit update destroy]
  before_action :set_authorize, except: %i[new create]

  def new
    @comment = @commentable.comments.new
  end

  def create
    result = Comment::Create.call(user: current_user, comments_params: comments_params, commentable: @commentable)
    redirect_back(fallback_location: root_path) if result.success?
  end

  def edit; end

  def update
    if @comment.update_attributes(comments_params)
      redirect_back(fallback_location: root_path )
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if @comment.destroy
      render json: {}, status: :accepted
    else
      render Json: { error: @comment.errors.messages }, status: :not_acceptable
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text)
  end

  def find_commentable
    @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
    @commentable = Post.find(params[:post_id]) if params[:post_id]
  end

  def find_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def set_authorize
    authorize @comment
  end
end
