class TechnologiesCell < Cell::Rails
  
  def operate args
    @current_user = args[:current_user]
    @technology = args[:technology]
    render if @current_user&&@current_user.has_role?(:admin)
  end
end
