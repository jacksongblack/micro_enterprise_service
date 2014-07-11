module ResponseHandleService
  
  VAR_REGULAR = /<(.*):/
  
  def handle_response_for object
    return redirect_to :back,alert: object.errors.first[1]  unless object.save
    controller_name = VAR_REGULAR.match(object.to_s)[1].downcase
    messge_address = "controller."+controller_name+"."+action_name+".success"
    yield(object) if block_given?
    redirect_to object, notice: t(messge_address)
  end
end
