class PostDecorator < ApplicationDecorator
  delegate_all

  def link_to_publisher
    text_link = 'Post published by '.concat(published_by)
    if community
      # link_to text_link, community_path(community)
    else
      link_to text_link, root_path
    end
  end

  def comments_count
    count = comments.count
    comments.each { |comments| count += comments.count_comments }
    count
  end

  private
  
  def published_by
    return  community.title if community

    user.nick
  end
end
