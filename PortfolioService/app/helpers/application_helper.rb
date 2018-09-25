module ApplicationHelper
  def login_link_helper
    if current_user.is_a?(User)
      link_to("Logout", destroy_user_session_path, method: :delete)
    else
      (link_to("Login", new_user_session_path)) + ' | ' + 
        (link_to("Register", new_user_registration_path))
    end
  end
  
  def source_helper
    if session[:source]
      content_tag(:p) do
        "Thanks, for visit from #{session[:source]}"
      end
    end
  end
end
