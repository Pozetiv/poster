module UsersHelper
  def login_logout_sign_buttons
    if user_signed_in?
      link_to 'Logout', destroy_user_session_path
    else
      content_tag :div, class: 'd-flex' do
        concat(
          link_to('Log in', new_user_session_path, class: 'mr-2') +
          link_to('Sign up', new_user_registration_path)
        )
      end
    end
  end

  def vote_block(arg)
    "#{to_vote_up(arg)}<hr>#{arg[:object].cached_votes_total}<hr>#{to_vote_down(arg)}".html_safe
  end

  private

  def to_vote_up(arg)
    set_class = 'fa fa-chevron-up '
    set_class += 'text-success' if user_signed_in? && arg[:user].voted_up_on?(arg[:object])

    link_to( eval("up_vote_#{arg[:object].object.class.name.downcase}_path(id: #{arg[:object].id})")) do
      content_tag(:i, '', class: set_class)
    end
  end

  def to_vote_down(arg)
    set_class = 'fa fa-chevron-down '
    set_class += 'text-danger' if user_signed_in? && arg[:user].voted_down_on?(arg[:object])

    link_to(eval("down_vote_#{arg[:object].object.class.name.downcase}_path(id: #{arg[:object].id})")) do
      content_tag(:i, '', class: set_class)
    end
  end
end