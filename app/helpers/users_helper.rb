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
end