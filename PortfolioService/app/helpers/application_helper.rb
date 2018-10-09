module ApplicationHelper
  def login_link_helper style = ''
    if current_user.is_a?(GuestUser)
      (link_to("Login", new_user_session_path, class: style)) + 
        (link_to("Register", new_user_registration_path, class: style))
    else
      link_to("Logout", destroy_user_session_path, method: :delete, class: style)
    end
  end
  
  def source_helper
    if session[:source]
      content_tag(:p) do
        "Thanks, for visit from #{session[:source]}"
      end
    end
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blog_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
    ]
  end

  def nav_helper style, tag_type=nil
    nav_links = ''

    nav_items.each do |item|
      nav_links << "#{"<#{tag_type}>"if tag_type}<a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a>#{"</#{tag_type}>"if tag_type}"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end
  
  def alert_generator msg
    js add_gritter(msg, title: 'Error', sticky: false)
  end
  
  def copyright_generator
    WojtekViewTool::Renderer.copyright('Wojtek Kostański', 'All right reserved')
  end
end
