module ApplicationHelper
  def login_link_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to("Login", new_user_session_path, class: style)) + 
        (link_to("Register", new_user_registration_path, class: style))
    else
      link_to("Logout", destroy_user_session_path, method: :delete, class: style)
    end
  end

  def source_helper(styles)
    if session[:source]
      greeting = "Thanks, for visit from #{session[:source]}, feel free to #{link_to 'contact me', contact_path}"
      content_tag(:div, greeting.html_safe, class: styles)
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
      {
        url: tech_news_path,
        title: 'Tech News'
      }
    ]
  end

  def nav_helper(style, tag_type=nil)
    nav_links = ''

    nav_items.each do |item|
      nav_links << "#{"<#{tag_type}>" if tag_type}<a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a>#{"</#{tag_type}>"if tag_type}"
    end

    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    alert_generator(alert) if alert
  end

  def alert_generator(msg)
    js add_gritter(msg, title: 'Error', sticky: false)
  end

  def copyright_generator
    WojtekViewTool::Renderer.copyright('Wojtek Kostański', 'All right reserved')
  end
end
