class UserCell < Cell::Rails
  helper PostsHelper

  def nav args
    session_status= args[:session_status]
    @current_user = args[:current_user]
    template = session_status ?  "logined" : "unlogin"
    render view: template
  end
end
