module ApplicationHelper
  def login_link_helper
    if current_user.is_a?(GuestUser)
      (link_to("Login", new_user_session_path, class: 'nav-link')) + 
        (link_to("Register", new_user_registration_path, class: 'nav-link'))
    else
      link_to("Logout", destroy_user_session_path, method: :delete, class: 'nav-link')
    end
  end
  
  def source_helper
    if session[:source]
      content_tag(:p) do
        "Thanks, for visit from #{session[:source]}"
      end
    end
  end
  
  def copyright_generator
    WojtekViewTool::Renderer.copyright('Wojtek Kostański', 'All right reserved')
  end
end
