class EnterprisesCell < Cell::Rails

  def operate args
    @current_user = args[:current_user]
    @enterprise = args[:enterprise]
    render if @current_user&&(@current_user.enterprise.eql?(@enterprise)||@current_user.has_role?(:admin))
  end
end
