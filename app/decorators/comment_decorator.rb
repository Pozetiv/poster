class CommentDecorator < ApplicationDecorator
  delegate_all

  def reply_count
    text = comments.count > 1 ? "#{count_comments} more replies" : 'Reply'

    h.content_tag(:p, text)
  end
end