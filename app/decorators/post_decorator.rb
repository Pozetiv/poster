class PostDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def published_by
    return community.title if community

    user.nick
  end

  def comments_count
    count = comments.count
    comments.each { |comments| count += comments.count_comments }
    count
  end
end
