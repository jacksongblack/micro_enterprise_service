class ProductsCell < Cell::Rails

  def operate args
    @current_user = args[:current_user]
    @product = args[:product]
    render if @current_user&&@current_user.can_write?(@product)
  end
end
