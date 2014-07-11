class ApplicationCell < Cell::Rails

  def notice args
    @notice = args[:notice]
    render unless args[:notice].blank?
  end

  def alert args
    @alert = args[:alert]
    render unless args[:alert].blank?
  end

  def error args
    @error = args[:error]
    render unless args[:error].blank?
  end

end
