class ViewCountService

  def record_view user,option
    option = (user ? {user_id: user.id}.merge(option) : option)
    View.create(option)
  end
end
