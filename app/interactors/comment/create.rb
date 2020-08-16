class Comment::Create
  include Interactor

  delegate :user,            to: :context
  delegate :commentable,     to: :context
  delegate :comments_params, to: :context

  def call
    @comment = commentable.comments.new(comments_params)
    @comment.user = user
    context.fail! unless @comment.save
  end
end
