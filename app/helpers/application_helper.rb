module ApplicationHelper
    def login_helper style = ''
    if current_user
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    else
      (link_to "Register", new_user_registration_path , class: style)
      (link_to "Login", new_user_session_path, class: style)
    end
  end
  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
      
    if alert
      alert_generator alert
    end
  end
    
  def alert_generator msg
    js add_gritter(msg, title: "Victoria's Portfolio", sticky: false)
  end
end
