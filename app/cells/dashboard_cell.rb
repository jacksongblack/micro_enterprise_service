class DashboardCell < Cell::Rails
  helper ApplicationHelper
  
  def screen args
    return unless args[:controller].eql?("dashboard")
    @user = User.new
    session_status= args[:session_status]
    template = session_status ? "screen_with_logined" : "screen_with_unlogin"
    render view: template
  end

  def nav_collapse args
    @controller_name = args[:controller]
    @action_name = args[:action_name]
    render
  end

end
