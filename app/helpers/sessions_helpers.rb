helpers do

  def logged_in?
    !!session[:user_id]
  end

  def user_created_item?(item)
    return true if logged_in? && session[:user_id] == item.user_id
  end

end