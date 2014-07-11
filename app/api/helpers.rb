module HuthenticatedHelpers

  def authenticated?
    if cookies[:email] && User.find_by({email: cookies[:email]})
      return true
    else
      error!({"error" => "Unauth 401. please logo in!"}, 401)
    end
  end

  def current_user
    authenticated?
    User.find_by({email: cookies[:email]})
  end

end

